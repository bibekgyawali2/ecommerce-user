// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  Future<String> googleSignIn() async {
    String res;
    try {
      await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
      return res = 'success';
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    } on UnimplementedError catch (ex) {
      return res = ex.message.toString();
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
