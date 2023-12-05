import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

enum AuthStatus {
  loading,
  authenticated,
  unauthenticated,
}

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  AuthStatus build() {
    return AuthStatus.unauthenticated;
  }

  Future<void> login() async {
    state = AuthStatus.loading;
    await Future.delayed(const Duration(seconds: 2));
    state = AuthStatus.authenticated;
  }
}
