import 'dart:async';

import 'package:efeedlink_demo/src/blocs/bloc_provider.dart';
import 'package:flutter/material.dart'; 

class ProfileBloc extends BlocBase {

  int _number;

  StreamController<int> _profileController = StreamController<int>();
  Sink<int> get _inAdd => _profileController.sink;
  Stream<int> get outCounter => _profileController.stream;

  ProfileBloc(){
    _number = 0;
  }

  @override
  void dispose() {
    _profileController.close();
  }

  void increment() {
    _number += 1;
    _inAdd.add(_number);
  }

}