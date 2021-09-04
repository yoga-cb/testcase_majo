import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase_majo/service/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future signIn() async {
    try {
      emit(AuthLoading());
      await AuthService().googleLogin();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      AuthService().googleSignOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
