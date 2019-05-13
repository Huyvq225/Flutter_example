import 'package:efeedlink_demo/src/blocs/authorization_bloc.dart';
import 'package:efeedlink_demo/src/blocs/bloc_provider.dart';
import 'package:efeedlink_demo/src/blocs/profile_bloc.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {

    // final ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);
    final AuthorizationBloc authoBloc = BlocProvider.of<AuthorizationBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          authoBloc.increment();
        },
      ),
      body: Center(
        child: StreamBuilder(
          stream: authoBloc.outCounter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Center(
              child: Text('number: ${snapshot.data}'),
            );
          },
        ),
      ),
    );
  }


}