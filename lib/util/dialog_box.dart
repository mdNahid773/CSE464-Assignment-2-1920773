import 'package:flutter/material.dart';
import 'package:todo_app_iub/util/add_task_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  //VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    //required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.white,
      alignment: Alignment(0, 1),
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(20),
          topRight: Radius.circular(20))
      ),
      
      content: Container(
        height: 200,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Add a new task',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20
                  ),
            ),
            //get user input
            TextField(
              controller: controller,
              decoration:
                InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue
                    )
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue
                    )
                  ),
                  hintText: 'Add a new task...',
                
              ),
            ),
      
            SizedBox(height: 5,),

            MyButton(
              text: 'Add',
              onPressed: onSave,
            )
          ],
        ),
      ),
    );
  }
}