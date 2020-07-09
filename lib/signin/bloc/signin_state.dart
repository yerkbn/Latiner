part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  const SigninState();
}

class SigninInitial extends SigninState {
  @override
  List<Object> get props => [];
}

class LoadingSigninState extends SigninState {
  @override
  List<Object> get props => null;
}

class FailureSigninState extends SigninState {
  final String error;
  FailureSigninState(this.error);

  @override
  List<Object> get props => [error];
}

class SuccessSigninState extends SigninState {
  @override
  List<Object> get props => null;
}
