part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressAdded extends AddressState {}

class AddressError extends AddressState {}

class AddressFetched extends AddressState {
  final List<AddressModal> addressList;
  AddressFetched(this.addressList);
  @override
  List<Object?> get props => [addressList];
}
