import 'dart:convert';

import 'package:efeedlink_demo/src/blocs/authorization_bloc.dart';
import 'package:efeedlink_demo/src/blocs/bloc_provider.dart';
import 'package:efeedlink_demo/src/blocs/profile_bloc.dart';
import 'package:efeedlink_demo/src/models/authentication.dart';
import 'package:efeedlink_demo/src/models/login_request.dart';
import 'package:efeedlink_demo/src/models/user.dart';
import 'package:efeedlink_demo/src/resources/authorization_api_provider.dart';
import 'package:efeedlink_demo/src/resources/palette.dart';
import 'package:efeedlink_demo/src/ui/Authorization/Widget/login_button.dart';
import 'package:efeedlink_demo/src/ui/Authorization/Widget/text_field_autho.dart';
import 'package:efeedlink_demo/src/ui/profile_page/profile.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  Login({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  
  final TextStyle _TitleAuthorizationStyle =  TextStyle(
    color: Palette.gray_for_main_text,
    fontSize: 11.5,
    fontFamily: "HelveticaNeue-Bold");
  
  final TextStyle _TitleLoginScreenStyle = TextStyle(
    color: Palette.gray_for_main_text,
    fontSize: 30.7,
    fontFamily: "HelveticaNeue-Medium");

  final TextStyle _ForgetPasswordStyle = TextStyle(
    color: Palette.blue_for_forgot,
    decoration: TextDecoration.underline,
    fontSize: 13.4,
    );
    
  @override
  Widget build(BuildContext context) {
    final AuthorizationBloc authoBloc = BlocProvider.of<AuthorizationBloc>(context);

    String _emailText = "";
    String _passwordText = "";
    
    return Scaffold(
      backgroundColor: Palette.gray_for_background,
      body: Container(
        
        child: Padding(
          padding: const EdgeInsets.fromLTRB(19.2, 121.9, 19.2, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome!",
                style: _TitleLoginScreenStyle
              ),
              SizedBox(height: 19.6,),
              Text(
                "EMAIL",
                style: this._TitleAuthorizationStyle
              ),
              TextFieldAutho(placeholder: "email", obscure: false, onChange: (text) {
                _emailText = text;
                authoBloc.validateInfo(_emailText, _passwordText);
              },),
              Text(
                "PASSWORD",
                style: this._TitleAuthorizationStyle
              ),
              TextFieldAutho(placeholder: "password", obscure: true, 
                onChange: (text){
                _passwordText = text;
                authoBloc.validateInfo(_emailText, _passwordText);                  
                }
              ),
              SizedBox(height: 9.6,),
              GestureDetector(
                onTap: () {
                  print("Forgot Password");
                },
                child: Text(
                  "Forgot Password?",
                  style: _ForgetPasswordStyle
                  ) ,
              ),
              SizedBox(height: 45.2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 240,
                    height: 42.2,
                    child: StreamBuilder<bool>(
                      stream: authoBloc.validationResult,
                      initialData: false,
                      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        return LogInButton(changeColor: snapshot.data, onPressed: (){
                          print("Press Press");
                          // _PushToProfilePage();
                          LoginRequest request = LoginRequest(email: "bssdevel@gmail.com", password: "Bss123",device_platform: "ios", device_token: "", code: "");
                          // doLogin(request).then((response){
                          //   if (response.statusCode == 200) {
                          //     print(response.body);
                          //     // final a = Authentication.fromJson(json.decode(response.body));
                          //     print('card: ${Authentication.fromJson(json.decode(response.body))}');
                          //   } else {
                          //       print(response.statusCode);
                          //   }
                          // }).catchError((error){
                          //   print('error: $error');
                          // });
                          doLogin(request).then((response){
                            print('resp: ${response.data.token}');
                          }).catchError((err){
                            print('err: $err');
                          });
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Haven't had an account yet? ",
                    style: TextStyle(
                      color: Palette.gray_for_main_text,
                      fontSize: 13.4
                    ),
                    children: <TextSpan> [
                      TextSpan(
                        text: "SIGN UP",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Palette.blue_for_forgot,
                          fontFamily: "HelveticaNeue-Bold"
                        )
                      )
                    ]
                  )
                )
              )
              
            ],
          ),
        ),
      ),
    );
  }

  _PushToProfilePage() {
    final AuthorizationBloc authoBloc = BlocProvider.of<AuthorizationBloc>(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        
           return BlocProvider(
             bloc: authoBloc,
             child: Profile(),
           );
        }
      )
    );
  }
}

