import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_no_signin/models/todoClass.dart';
import 'package:todo_app_no_signin/provider/auth_provider.dart';
import 'package:todo_app_no_signin/shared/constants.dart';
import 'package:todo_app_no_signin/provider/db_provider.dart';
import 'package:uuid/uuid.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var uuid = Uuid();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _db = Provider.of<DbProvider>(context);
    Auth _auth = Provider.of<Auth>(context);
    return AlertDialog(
      content: SizedBox(
        height: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 30),
            // title field
            TextFormField(
              controller: titleController,
              decoration: textInputDecoration.copyWith(
                label: const Text('Title'),
              ),
            ),
            const SizedBox(height: 15),
            // discreiption field
            TextFormField(
              maxLines: 3,
              controller: descriptionController,
              decoration: textInputDecoration.copyWith(
                label: const Text('Description'),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Todo todo = Todo(
                  title: titleController.text.trim(),
                  disc: descriptionController.text.trim(),
                  todoId: uuid.v4(),
                );

                await _db.saveTodo(todo, _auth.uid);
                print('test');
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            )
          ],
        ),
      ),
    );
  }
}
