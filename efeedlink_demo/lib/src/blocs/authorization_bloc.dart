import 'dart:async';

import 'package:efeedlink_demo/src/blocs/bloc_provider.dart';
import 'package:flutter/material.dart'; 
import 'package:rxdart/rxdart.dart';

class AuthorizationBloc extends BlocBase {

  String _emailText;
  String _passwordText;



  StreamController<bool> _authorizationController = StreamController<bool>();
  Sink<bool> get _validInfo => _authorizationController.sink;
  Stream<bool> get validationResult => _authorizationController.stream;

  // final _authorizationSubject = PublishSubject<bool>();
  // Function(bool) get _validInfo => _authorizationSubject.sink.add;
  // Observable<bool> get validationResult => _authorizationSubject.stream;

  void dispose() {
    _authorizationController.close();
    // _authorizationSubject.close();
    _profileController.close();
  }

  // void validateInfo(String email, String password) {
  //   _emailText = email;
  //   _passwordText = password; 
  //   if (_emailText != "" && _passwordText != "") {
  //     _validInfo(true);
  //   } else {
  //     _validInfo(false);
  //   }
  // }

  void validateInfo(String email, String password) {
    _emailText = email;
    _passwordText = password; 
    if (_emailText != "" && _passwordText != "") {
      _validInfo.add(true);
    } else {
      _validInfo.add(false);
    }
  }

  int _number = 0;
  StreamController<int> _profileController = StreamController<int>();
  Sink<int> get _inAdd => _profileController.sink;
  Stream<int> get outCounter => _profileController.stream;

  void increment() {
    _number += 1;
    _inAdd.add(_number);
  }
}