import 'package:bloc_task/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool rememberMe = false;
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if (event is RememberMeToggleEvent) {
        rememberMe = !rememberMe;
        emit(RememberMeChangedState(rememberMe: rememberMe));
      }
      if (event is AuthSignInEvent) {
        AuthService authService = AuthService();
      }
    });
  }
}
