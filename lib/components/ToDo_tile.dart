import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/size_config.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20,),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Color(0xFFF20929),
            borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            // color: Color(0xFFFF90D0),
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFFD98BFF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(
            color: Colors.purple,
            width: 1.0,
          ),
          ),
          child: Row(
            children: [
              Container(
                height:40 ,
                width: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.purple
                ),
              ),
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Color(0xFFCA6FFF),
                checkColor: Colors.white,
              ),
              Container(
                width: getProportionateScreenWidth(240),
                child: Text(taskName, style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
