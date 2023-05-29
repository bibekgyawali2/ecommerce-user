import 'package:bloc/bloc.dart';
import 'package:ecommerceuser/constants/firebase_constants.dart';
import 'package:meta/meta.dart';

part 'order_cubit_state.dart';

class OrderCubitCubit extends Cubit<OrderCubitState> {
  OrderCubitCubit() : super(OrderCubitInitial());

  addtoCart({title, img, sellername, qty, tprice}) async {
    emit(OrderCubitLoading());
    await firestore.collection(cartCollections).doc().set({
      'title': title,
      'img': img,
      "sellername": sellername,
      "qty": qty,
      "tprice": tprice,
      "added_by": currentUser!.uid,
    });
    emit(OrderCubitSuccess());
  }
}
