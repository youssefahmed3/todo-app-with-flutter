import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_no_signin/models/todoClass.dart';
import 'package:todo_app_no_signin/provider/auth_provider.dart';
import 'package:todo_app_no_signin/provider/db_provider.dart';
import 'package:todo_app_no_signin/shared/constants.dart';

class TaskDetails extends StatefulWidget {
  String? title;
  String? disc;
  String? todoId;
  TaskDetails({Key? key, this.title, this.disc, this.todoId}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: widget.title);
    // print(titleController.text);
    TextEditingController descriptionController =
        TextEditingController(text: widget.disc);
    // print(descriptionController.text);

    Auth _auth = Provider.of<Auth>(context);
    DbProvider _db = Provider.of<DbProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Here You Can Edit Your Tasks',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: titleController,
              decoration:
                  textInputDecoration.copyWith(label: const Text('Title')),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                maxLines: 30,
                decoration: textInputDecoration.copyWith(
                    label: const Text('Discreption')),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Todo todo = Todo(
                  title: titleController.text.trim(),
                  disc: descriptionController.text.trim(),
                  todoId: widget.todoId,
                );

                await _db.saveTodo(todo, _auth.uid);
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () async {
                Todo todo = Todo(
                  title: titleController.text.trim(),
                  disc: descriptionController.text.trim(),
                  todoId: widget.todoId,
                );

                await _db.deleteTodo(todo, _auth.uid);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
