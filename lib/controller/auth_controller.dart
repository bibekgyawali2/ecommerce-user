// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../constants/firebase_constants.dart';

class AuthController {
  //loginmethod
  Future<UserCredential?> loginMethod({email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return userCredential;
  }

  //signup method
  Future<UserCredential?> signUpMethod(email, password) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return userCredential;
  }

  //google sign in

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in to Firebase with the credential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is new
      if (userCredential.additionalUserInfo?.isNewUser == true) {
        final User? currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          await storeUserData(
              name: currentUser.displayName, email: currentUser.email);
        }
      }

      return userCredential;
    } catch (error) {
      print('Failed to sign in with Google: $error');
      return null;
    }
  }

  //store data
  storeUserData({name, email, password}) async {
    DocumentReference store =
        firestore.collection(usersCollections).doc(currentUser!.uid);
    store.set({
      "name": name,
      "password": password,
      "email": email,
      "image_url": '',
      "id": currentUser!.uid,
    });
  }
}
