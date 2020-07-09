import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latiner/auth/bloc/auth_bloc.dart';
import 'package:latiner/signin/resources/signin_api_provider.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SigninApiProvider _signinApiProvider = SigninApiProvider();
  final AuthBloc _authBloc;

  SigninBloc(this._authBloc) : super(SigninInitial());

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is LoginButtonPressedSigninEvent) {
      yield LoadingSigninState();
      try {
        if (event.username.length < 7) {
          yield FailureSigninState('Min 7 letter!!!');
        } else {
          final user =
              await _signinApiProvider.fetchAuthenticate(event.username);
          _authBloc.add(LoggedInAuthEvent(user));
          yield SigninInitial();
        }
      } catch (error) {
        yield FailureSigninState(error.toString());
      }
    }
  }
}
