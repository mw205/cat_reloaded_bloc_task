part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {
  final bool rememberMe = false;
}

class AuthSigningInState extends AuthState {}

class RememberMeChangedState extends AuthState {
  final bool rememberMe;

  RememberMeChangedState({required this.rememberMe});
}
