import 'package:efeedlink_demo/src/resources/palette.dart';
import 'package:flutter/material.dart';

class TextFieldAutho extends StatelessWidget {

  TextFieldAutho({this.placeholder,@required this.obscure, this.onChange});

  //* Placeholder for textfield
  final String placeholder;

  //* Obscure for textfield
  final bool obscure;

  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.2,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 13.4),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(
          width: 1.0,
          color: Palette.gray_for_border_tf
        ),
        borderRadius: BorderRadius.all(Radius.circular(3.8))
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: this.placeholder
        ),
        obscureText: this.obscure,
        onChanged: (text) {
          this.onChange(text);
        },
      )
    );
  }
}