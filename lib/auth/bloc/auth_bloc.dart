import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latiner/auth/model/user.dart';
import 'package:latiner/auth/resources/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository = UserRepository();

  /// When app first start it Will be in loading state
  AuthBloc() : super(LoadingAuthState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // App first loaded
    if (event is AppStartedAuthEvent) {
      final bool isAuthenticated = await userRepository.isAuthenticated();
      if (isAuthenticated) {
        final currentUser = await userRepository.getCurrentUser();
        yield AuthenticatedAuthState(currentUser);
      } else {
        yield UnauthenticatedAuthState();
      }
    }

    /// When user Signin to the system
    /// we call this evenet and it store
    /// user to [shared_preferences]
    if (event is LoggedInAuthEvent) {
      yield LoadingAuthState();
      await userRepository.persistUser(event.user);
      final currentUser = await userRepository.getCurrentUser();
      yield AuthenticatedAuthState(currentUser);
    }

    /// When user press Log out button
    /// this method will be called
    if (event is LoggedOutAuthEvent) {
      yield LoadingAuthState();
      await userRepository.deleteUser();
      yield UnauthenticatedAuthState();
    }
  }
}
