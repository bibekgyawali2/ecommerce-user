part of 'order_cubit_cubit.dart';

@immutable
abstract class OrderCubitState {}

class OrderCubitInitial extends OrderCubitState {}

class OrderCubitLoading extends OrderCubitState {}

class OrderCubitSuccess extends OrderCubitState {}

class OrderCubitFailure extends OrderCubitState {}

class OrderFetched extends OrderCubitState {
  final List<CartModal> cartList;

  OrderFetched(this.cartList);

  @override
  List<Object?> get props => [cartList];
}
