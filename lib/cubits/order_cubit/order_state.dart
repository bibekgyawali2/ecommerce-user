part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {}

class OrderFailure extends OrderState {}

class OrderFetched extends OrderState {
  final List<OrderModal> orderList;

  OrderFetched(this.orderList);

  @override
  List<Object?> get props => [orderList];
}
