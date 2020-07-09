part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

/// When App first started we triger AuthBloc
/// to check does user is signin or not
class AppStartedAuthEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

/// When user signin with some system
/// we call this event to notify bloc that user
/// authenticated
class LoggedInAuthEvent extends AuthEvent {
  final User user;
  LoggedInAuthEvent(this.user);
  @override
  List<Object> get props => [user];
}

/// We delete all user data to by calling this event
class LoggedOutAuthEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
