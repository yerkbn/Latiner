import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latiner/auth/ui/loading_page.dart';
import 'package:latiner/auth/ui/profile_page.dart';
import 'package:latiner/signin/ui/signin_page.dart';

import 'auth/bloc/auth_bloc.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc();

    /// When App first started we triger [AuthBloc]
    /// to check does user is authenticated or not
    _authBloc.add(AppStartedAuthEvent());
    super.initState();
  }

  @override
  void dispose() {
    /// When widget close call [cloase] method too
    /// because it lead to memory leak
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => _authBloc,
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthBloc, AuthState>(
          bloc: _authBloc,
          builder: (BuildContext context, AuthState state) {
            if (state is AuthenticatedAuthState) {
              return AuthenticatedApp();
            }
            if (state is UnauthenticatedAuthState) {
              return UnauthenticatedApp();
            }
            if (state is LoadingAuthState) {
              return LoadingPage();
            }
          },
        ),
      ),
    );
  }
}

/// --- The Unauthenticated routes ---
class UnauthenticatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => SigninPage(),
      },
    );
  }
}

/// --- The Authenticated routes ---
class AuthenticatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (BuildContext context) => ProfilePage(),
      },
    );
  }
}
