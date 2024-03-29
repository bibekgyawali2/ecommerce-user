import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceuser/constants/firebase_constants.dart';
import 'package:ecommerceuser/modals/cart_modal.dart';
import 'package:meta/meta.dart';

part 'order_cubit_state.dart';

class OrderCubitCubit extends Cubit<OrderCubitState> {
  OrderCubitCubit() : super(OrderCubitInitial());

//add to cart
  addtoCart({title, img, sellername, qty, tprice, productId}) async {
    emit(OrderCubitLoading());
    final DocumentReference cartDocRef =
        firestore.collection(cartCollections).doc();
    await firestore.collection(cartCollections).doc().set({
      'title': title,
      'img': img,
      "sellername": sellername,
      "qty": 1,
      "tprice": tprice,
      "added_by": currentUser!.uid,
      "cartId": cartDocRef.id,
      "productId": productId,
      "created_at": DateTime.now(),
    });
    getCart();
  }

  //get cart of current user
  FutureOr<void> getCart() async {
    emit(OrderCubitLoading());
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Cart')
          .where('added_by', isEqualTo: currentUser!.uid)
          .get();
      List<DocumentSnapshot> documents = snapshot.docs;
      List<CartModal> cartList = documents.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return CartModal(
          added_by: data['added_by'],
          img: data['img'],
          qty: data['qty'],
          sellername: data['sellername'],
          title: data['title'],
          tprice: data['tprice'],
          productId: data['productId'],
          cartId: document.id,
        );
      }).toList();
      emit(OrderFetched(cartList));
    } catch (e) {
      emit(OrderCubitFailure());
    }
  }

  //delete cart items
  void deleteCartItems(cartId) async {
    await firestore.collection('Cart').doc(cartId).delete();
  }
}
