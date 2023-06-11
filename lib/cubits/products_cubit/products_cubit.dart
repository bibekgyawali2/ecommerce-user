import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceuser/constants/firebase_constants.dart';
import 'package:meta/meta.dart';

import '../../modals/products_modals.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  //Fetch Product according to catagory
  // getProduct(category) async {
  //   emit(ProductsFetchLoading());
  //   var productList = firestore
  //       .collection(productsCollections)
  //       .where('p_category', isEqualTo: category)
  //       .snapshots();
  //   emit(ProductFetched(productList));
  // }

  //fetch all products
  Future<void> fetchData() async {
    emit(ProductsFetchLoading());
    try {
      emit(ProductsFetchLoading());

      QuerySnapshot snapshot = await firestore.collection('Products').get();

      List<DocumentSnapshot> documents = snapshot.docs;
      List<Product> productList = documents.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return Product(
          pName: data['p_name'],
          pPrice: data['p_price'],
          //datePublished: data['datePublished'],
          pCatagory: data['p_catagory'],
          pDesc: data['p_desc'],
          pImg: data['p_img'],
          pRating: data['p_rating'],
          pSeller: data['p_seller'],
          productId: data['productId'],
        );
      }).toList();

      emit(ProductFetched(productList));
    } catch (e) {
      emit(ProductsFetchError(e.toString()));
    }
  }
}
