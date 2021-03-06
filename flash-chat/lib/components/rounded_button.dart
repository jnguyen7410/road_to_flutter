import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.color, this.buttonText, this.onPressed, this.child});

  final Color color;
  final String buttonText;
  final Function onPressed;
  final Widget child;

  static const String defaultText = 'No text provided';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: child ??
              Text(
                this.buttonText ?? defaultText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
        ),
      ),
    );
  }
}
