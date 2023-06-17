abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String res;
  AuthSuccess({
    required this.res,
  });
}

class AuthFailure extends AuthState {
  final String res;
  AuthFailure({
    required this.res,
  });
}
