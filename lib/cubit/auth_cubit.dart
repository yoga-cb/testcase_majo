import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testcase_majo/model/User_model.dart';
import 'package:testcase_majo/service/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn() async {
    try {
      emit(AuthLoading());
      AuthService().googleLogin();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(AuthSuccess());
      }
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
