
import 'package:efeedlink_demo/src/blocs/authorization_bloc.dart';
import 'package:efeedlink_demo/src/blocs/bloc_provider.dart';
import 'package:efeedlink_demo/src/ui/Authorization/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthorizationBloc>(
        child: Login(),
        bloc: AuthorizationBloc()
      ),
    );
  }
}





