part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthSignUpEvent extends AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInEvent({required this.email, required this.password});

}

class RememberMeToggleEvent extends AuthEvent {}
