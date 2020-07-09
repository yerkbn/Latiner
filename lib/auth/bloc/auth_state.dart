part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

/// When user already authenticated to the system
class AuthenticatedAuthState extends AuthState {
  final User user;
  AuthenticatedAuthState(this.user);
  @override
  List<Object> get props => [user];
}

/// When user not authenticated
class UnauthenticatedAuthState extends AuthState {
  @override
  List<Object> get props => null;
}

/// When we fetach user data we show loading status
class LoadingAuthState extends AuthState {
  @override
  List<Object> get props => null;
}
