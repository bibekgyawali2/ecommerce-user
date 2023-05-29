part of 'order_cubit_cubit.dart';

@immutable
abstract class OrderCubitState {}

class OrderCubitInitial extends OrderCubitState {}

class OrderCubitLoading extends OrderCubitState {}

class OrderCubitSuccess extends OrderCubitState {}
