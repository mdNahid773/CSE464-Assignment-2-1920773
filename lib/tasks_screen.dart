import 'package:flutter/material.dart';
import 'package:todo_app_iub/util/add_task.dart';
import 'package:todo_app_iub/util/dialog_box.dart';
import 'package:todo_app_iub/util/task_tile.dart';


class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  // List<AddTask> taskList = [
  //   AddTask(name: 'Task 1'),
  //   AddTask(name: 'Task 2'),
  //   AddTask(name: 'Task 3'),
  // ];

  List taskList = [
    ['Task 1', false],
    ['Task 2', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
    // db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          //onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      taskList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed:() {
          createNewTask();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/my_image.jpeg"),
                ),
                SizedBox(height: 10),
                Text(
                  "Ashif Mujtoba",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "ashif@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "My Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  taskList.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              //height: 100,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),

              child: Container(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder:(context, index) {
                    return TaskTile(
                      taskName: taskList[index][0],
                      taskCompleted: taskList[index][1],
                      onChanged:(value) => checkBoxChanged(value, index),
                      deleteFunction: (context) => deleteTask(index),
                    );
                  },
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
