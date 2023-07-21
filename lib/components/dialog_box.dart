import 'package:flutter/material.dart';
import 'package:todolist/components/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,required this.controller, required this.onCancel,required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFD98BFF),
      content: Container(height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //get user input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add new task",
            ),
          ),

          //buttons --> save + cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //save button
              Buttons(text: "save", onPressed:onSave),
              //cancel button
              Buttons(text: "cancel", onPressed:onCancel)
            ],
          )
        ],
      ),),
    );
  }
}
