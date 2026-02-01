
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/local/local_storage.dart';
import '../auth_repo/auth_repository.dart';
import '../validator.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginButtonPressed>(_onLogin);
    on<CheckLoginStatus>(_onCheckLoginStatus);
    on<LogoutEvent>(_onLogout);
  }

  // -----------------------------------------------------------
  // 🔹 LOGIN HANDLER
  // -----------------------------------------------------------
  Future<void> _onLogin(
      LoginButtonPressed event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      // 🔹 Step 1: Validation
      final emailError = InputValidator.email(event.email);
      final passwordError = InputValidator.password(event.password);

      if (emailError != null || passwordError != null) {
        // emit validation state
        emit(AuthValidationError(
          emailError: emailError,
          passwordError: passwordError,
        ));
        return; // stop further processing
      }
      // Call Fake Login API (ReqRes)
      final token = await repository.login(
        email: event.email,
        password: event.password,
      );

      // Save token locally
      await AuthLocalStorage.saveLogin(
        token: token,
      );

      emit(AuthAuthenticated(token));
    } catch (e) {
      emit(AuthError(e.toString().replaceAll("Exception:", "").trim()));
    }
  }

  // -----------------------------------------------------------
  // 🔹 CHECK LOGIN STATUS (AUTO LOGIN)
  // -----------------------------------------------------------
  Future<void> _onCheckLoginStatus(
      CheckLoginStatus event,
      Emitter<AuthState> emit,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      emit(AuthAuthenticated(token)); // User already logged in
    } else {
      emit(AuthLoggedOut());
    }
  }


  // -----------------------------------------------------------
  // 🔹 LOGOUT HANDLER
  // -----------------------------------------------------------
  Future<void> _onLogout(
      LogoutEvent event,
      Emitter<AuthState> emit,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');

    emit(AuthLoggedOut());
  }
}



