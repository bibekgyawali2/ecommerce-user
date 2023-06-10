import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceuser/constants/firebase_constants.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  //add address of current user
  addAddress(
      {country, province, city, postalcode, street, phone, other}) async {
    final DocumentReference addressDocRef =
        firestore.collection(addressCollections).doc();
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
  }

  //get address of current user
}
