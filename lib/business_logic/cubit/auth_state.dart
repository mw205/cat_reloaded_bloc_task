part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class RememberMeToggeled extends AuthState {
  final bool rememberMe;

  RememberMeToggeled({required this.rememberMe});
}

class TermsAgrementToggeled extends AuthState {
  final bool termsAgrement;

  TermsAgrementToggeled({required this.termsAgrement});
}

class RegistrationLoading extends AuthState {}

class RegistrationSuccess extends AuthState {}

class RegistrationFailure extends AuthState {
  final String error;
  RegistrationFailure({required this.error});
}
