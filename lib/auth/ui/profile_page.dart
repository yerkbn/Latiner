import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latiner/auth/bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  AuthBloc _authBloc;

  @override
  void initState() {
    /// Get [AuthBloc] instance from [BlocProvider]
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль', style: TextStyle(color: Colors.black)),
      ),

      /// Get user data by listening [AuthBloc]
      body: BlocBuilder(
        bloc: _authBloc,
        builder: (BuildContext context, AuthState state) {
          if (state is AuthenticatedAuthState) {
            return Column(
              children: <Widget>[
                Center(
                    child: Text(
                  '${state.user.email}',
                  style: Theme.of(context).textTheme.headline5,
                )),
                Center(
                    child: RaisedButton(
                        color: Colors.yellow,
                        onPressed: () => _authBloc.add(LoggedOutAuthEvent()),
                        child: Text(
                          'Выйти',
                        )))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
