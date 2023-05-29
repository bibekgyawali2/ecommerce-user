part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductFetched extends ProductsState {
  final List<Product> productList;

   ProductFetched(this.productList);

  @override
  List<Object?> get props => [productList];
}

class ProductsFetchLoading extends ProductsState {}

class ProductsFetchError extends ProductsState {
  final String message;

  ProductsFetchError(this.message);
}
