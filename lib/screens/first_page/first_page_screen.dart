import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/first_page/components/body.dart';

class FirstPage extends StatelessWidget {
  static String routeName="/";
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
