import 'package:bloc_task/data/web_services/auth_service.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  bool rememberMe = false;
  bool termsAgrement = false;

  AuthCubit() : super(AuthInitial());
  void rememberMeToggle() {
    rememberMe = !rememberMe;
    emit(RememberMeToggeled(rememberMe: rememberMe));
  }

  void termsAgrementToggle() {
    termsAgrement = !termsAgrement;
    emit(RememberMeToggeled(rememberMe: rememberMe));
  }

  void signIn(String email, String password) async {
    emit(RegistrationLoading());
    try {
      final result = await AuthService.login(email, password);
      if (result == true) {
        emit(RegistrationSuccess());
      }
    } catch (e) {
      emit(RegistrationFailure(error: "try again"));
    }
  }

  void signUp(
      {required String name,
      required String phone,
      required String email,
      required String password,
    }) async {
    emit(RegistrationLoading());
    try {
      final result = await AuthService.registeration(
          name, phone, email, password);
      if (result == true) {
        emit(RegistrationSuccess());
      }
    } catch (e) {
      emit(RegistrationFailure(error: "try again"));
    }
  }
}
