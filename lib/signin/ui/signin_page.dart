import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latiner/auth/bloc/auth_bloc.dart';
import 'package:latiner/signin/bloc/signin_bloc.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  State<SigninPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SigninPage> {
  final _usernameController = TextEditingController();
  SigninBloc _signinBloc;
  @override
  void initState() {
    _signinBloc = SigninBloc(BlocProvider.of<AuthBloc>(context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SigninBloc, SigninState>(
      bloc: _signinBloc,
      listener: (BuildContext context, SigninState state) {
        if (state is FailureSigninState) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Failure, ${state.error}'),
            backgroundColor: Colors.redAccent,
          ));
        }
      },
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 200),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                ),
                labelText: 'Номер телефона (+7) или email',
              ),
            ),
            BlocBuilder<SigninBloc, SigninState>(
              bloc: _signinBloc,
              builder: (BuildContext context, SigninState state) {
                return Center(
                    child: RaisedButton(
                  color: Colors.redAccent,
                  onPressed: state is LoadingSigninState
                      ? null
                      : () => _signinBloc.add(LoginButtonPressedSigninEvent(
                            _usernameController.text,
                          )),
                  child: Text(
                      state is LoadingSigninState ? 'Loading...' : 'Login'),
                ));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
