import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/components/ToDo_tile.dart';
import 'package:todolist/components/dialog_box.dart';
import 'package:todolist/data/database.dart';

class Body extends StatefulWidget {
  const Body({super.key, });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  //reference the hive box
  final _myBox = Hive.box("mybox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {

    //if this first time opening the app, then create default data
    if (_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      //there already existing data
      db.loadData();
    }
    super.initState();
  }


  //text controller
  final _controller = TextEditingController();



  // // list of to do tasks for testttt
  // List toDoList = [
  //   ["one",false],
  //   ["second", false],
  // ];


  //checkbox when tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }



  //save New Task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }



  //creating new task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }


  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        title: Center(child: Text("TO DO", style: TextStyle(fontSize: 22,color: Colors.white),)),
      ),

      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          elevation: 10,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
          splashColor: Colors.purple,
          backgroundColor: Colors.white,
          onPressed:createNewTask ,
          child: Icon(Icons.add,color: Colors.purple ,size: 40,),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image:
              AssetImage("assets/images/t.jpg"),
              fit: BoxFit.cover,
            )),

        child: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value)=> checkBoxChanged(value,index),
              deleteFunction :(context) => deleteTask(index),
          );
        },
          ),
      )
    );
  }
}
