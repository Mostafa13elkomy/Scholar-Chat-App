import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String Password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: Password);
      emit(LoginSucsess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailur(erromessage: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailur(erromessage: 'wrong password'));
      }
    } catch (e) {
      LoginFailur(erromessage: 'something went wrong');
    }
  }
}
