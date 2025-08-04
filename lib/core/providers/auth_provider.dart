import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_entry_app/useMethod.dart/essentialMethod.dart';

class AuthState {
  final bool isLoggedIn;

  const AuthState({this.isLoggedIn = false});
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState()) {
    final isLoggedIn = LocalStorage.getLogin();
    state = AuthState(isLoggedIn: isLoggedIn);
  }

  void login() {
    state = AuthState(isLoggedIn: true);
    LocalStorage.setLogin(true);
  }

  void logout() {
    state = AuthState(isLoggedIn: false);
    LocalStorage.clearLogin();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
