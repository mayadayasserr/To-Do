import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/ToDo_tile.dart';

class Body extends StatefulWidget {
  const Body({super.key, });

  // final String title;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD5F4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFF85BF),
        title: Center(child: Text("TO DO", style: TextStyle(fontSize: 22,color: Colors.black),)),
      ),
      body: ListView(
        children: [
          ToDoTile(),
        ],
      )
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$counter',
      //         style: Theme.of(context).textTheme.headline3,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
