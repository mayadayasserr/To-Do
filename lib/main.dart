import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/routes.dart';
import 'package:todolist/screens/first_page/first_page_screen.dart';

void main() async{

  //init the hive
  await Hive.initFlutter();


  //open a box
  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO',
      debugShowCheckedModeBanner: false,

      initialRoute: FirstPage.routeName,

      routes: routes,
    );
  }
}


