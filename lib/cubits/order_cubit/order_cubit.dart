import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceuser/constants/firebase_constants.dart';
import 'package:ecommerceuser/modals/cart_modal.dart';
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
    });
  }
}
