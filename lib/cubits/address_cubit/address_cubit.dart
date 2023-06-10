import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceuser/constants/firebase_constants.dart';
import 'package:ecommerceuser/modals/addressmodal.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  //add address of current user
  addAddress(
      {country, province, city, postalcode, street, phone, other}) async {
    final DocumentReference addressDocRef =
        firestore.collection(addressCollections).doc();
    emit(AddressLoading());
    await firestore.collection(addressCollections).doc().set({
      'Country': country,
      'Province': province,
      "City": city,
      "Street": street,
      "PostalCode": postalcode,
      "phone": phone,
      "otherDesCription": other,
      "user_id": currentUser!.uid,
      "cartId": addressDocRef.id,
    });
    emit(AddressAdded());
  }

  //get address of current user
  Future<void> getAddress() async {
    emit(AddressLoading());
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Address')
          .where('user_id', isEqualTo: currentUser!.uid)
          .get();
      List<DocumentSnapshot> documents = snapshot.docs;
      List<AddressModal> addressList =
          documents.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return AddressModal(
          City: data['City'],
          Country: data['Country'],
          PostalCode: data['PostalCode'],
          Province: data['Province'],
          Street: data['Province'],
          otherDescription: data['otherDescription'],
          phone: data['phone'],
          user_id: data['user_id'],
        );
      }).toList();
      emit(AddressFetched(addressList));
    } catch (e) {
      emit(AddressError());
    }
  }
}
