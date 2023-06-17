import 'package:bloc/bloc.dart';
import 'package:ecommerceuser/controller/auth_controller.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final auth = AuthController();
  googlelogin() async {
    String a = await auth.googleSignIn();
    if (a == 'success') {
      emit(AuthSuccess(res: a));
    } else {
      emit(AuthFailure(res: a));
    }
  }
}
