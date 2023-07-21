import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Buttons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.black,
      elevation: 4,
      onPressed: onPressed,
      color: Colors.purple,
      child: Text(text,style: TextStyle(fontSize: 19,color: Colors.white),),);
  }
}
