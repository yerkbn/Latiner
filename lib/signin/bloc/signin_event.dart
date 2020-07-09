part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
}

class LoginButtonPressedSigninEvent extends SigninEvent {
  final String username;

  LoginButtonPressedSigninEvent(this.username);

  @override
  List<Object> get props => [username];
}
