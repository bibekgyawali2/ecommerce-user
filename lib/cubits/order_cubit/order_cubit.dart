import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceuser/constants/firebase_constants.dart';
import 'package:ecommerceuser/modals/cart_modal.dart';
import 'package:ecommerceuser/modals/order_modal.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  //place order
  Future<void> addOrder({
    String? country,
    String? province,
    String? city,
    String? postalcode,
    String? street,
    String? phone,
    String? other,
    List<CartModal>? listCartModel,
  }) async {
    final DocumentReference orderDocRef =
        FirebaseFirestore.instance.collection(orderCollections).doc();

    List<Map<String, dynamic>> cartListJson = listCartModel != null
        ? listCartModel.map((cart) => cart.toJson()).toList()
        : [];

    await orderDocRef.set({
      'Country': country,
      'Province': province,
      'City': city,
      'PostalCode': postalcode,
      'Street': street,
      'phone': phone,
      'otherDesCription': other,
      'user_id': currentUser!.uid,
      'orderId': orderDocRef.id,
      'cartItems': cartListJson,
      'tPrice': 100,
    });
  }

  //get order of current user
  Future<void> getOrder() async {
    emit(OrderLoading());
    // try {
    QuerySnapshot snapshot = await firestore
        .collection('Order')
        .where('user_id', isEqualTo: currentUser!.uid)
        .get();
    List<DocumentSnapshot> documents = snapshot.docs;
    List<OrderModal> orderList = documents.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      List<Map<String, dynamic>> cartItems =
          List<Map<String, dynamic>>.from(data['cartItems']);
      return OrderModal(
        orderId: data['orderId'],
        phone: data['phone'],
        products: cartItems,
        province: data['Province'],
        street: data['Street'],
        totalPrice: data['tPrice'], // Corrected this line
        userId: data['user_id'],
      );
    }).toList();
    emit(OrderFetched(orderList));
    // } catch (e) {
    // emit(OrderFailure());
    // }
  }
}
