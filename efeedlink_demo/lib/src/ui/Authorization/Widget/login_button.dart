import 'package:efeedlink_demo/src/resources/palette.dart';
import 'package:flutter/material.dart';

class LogInButton extends StatelessWidget {

  LogInButton({this.changeColor,@required this.onPressed});

  final bool changeColor;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        print("Press Login");
        this.onPressed();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.8),
          bottomRight: Radius.circular(4.8)
        )),
      color: (this.changeColor == true ) ? Colors.blue : Palette.gray_dissable ,
      child: Center(
        child: Text(
          "LOG IN",
          style: TextStyle(
            color: Palette.white,
            fontFamily: "HelveticaNeue-Bold",
            fontSize: 15.4
          ),
        ),
      ),
      
    );
  }
}