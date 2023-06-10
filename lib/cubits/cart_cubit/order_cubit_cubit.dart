import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceuser/constants/firebase_constants.dart';
import 'package:ecommerceuser/modals/cart_modal.dart';
import 'package:meta/meta.dart';

part 'order_cubit_state.dart';

class OrderCubitCubit extends Cubit<OrderCubitState> {
  OrderCubitCubit() : super(OrderCubitInitial());

  addtoCart({title, img, sellername, qty, tprice}) async {
    emit(OrderCubitLoading());
    final DocumentReference cartDocRef =
        firestore.collection(cartCollections).doc();
    await firestore.collection(cartCollections).doc().set({
      'title': title,
      'img': img,
      "sellername": sellername,
      "qty": qty,
      "tprice": tprice,
      "added_by": currentUser!.uid,
      "cartId": cartDocRef.id,
    });
    emit(OrderCubitSuccess());
  }

  //get order of current user
  Future<void> getCart() async {
    emit(OrderCubitLoading());
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Cart')
          .where('added_by', isEqualTo: currentUser!.uid)
          .get();
      List<DocumentSnapshot> documents = snapshot.docs;
      List<OrderModal> orderList = documents.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return OrderModal(
          added_by: data['added_by'],
          img: data['img'],
          qty: data['qty'],
          sellername: data['sellername'],
          title: data['title'],
          tprice: data['tprice'],
          cartId: document.id,
        );
      }).toList();
      emit(OrderFetched(orderList));
    } catch (e) {
      emit(OrderCubitFailure());
    }
  }

  //delete cart items
  void deleteCartItems(orderId) async {
    await firestore.collection('Cart').doc(orderId).delete();
  }
}
