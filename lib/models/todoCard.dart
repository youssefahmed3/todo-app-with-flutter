import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_no_signin/models/taskDetails.dart';
import 'package:todo_app_no_signin/models/todoClass.dart';
import 'package:todo_app_no_signin/provider/auth_provider.dart';
import 'package:todo_app_no_signin/provider/db_provider.dart';
import 'package:todo_app_no_signin/shared/constants.dart';

class TodoCard extends StatefulWidget {
  String? title;
  String? disc;
  String? todoId;
  bool? isCompleted;
  bool? isCheckboxChange;
  TodoCard({
    Key? key,
    this.title,
    this.disc,
    this.todoId,
    this.isCompleted,
    this.isCheckboxChange,
    /* this.isCheckboxChange, */
  }) : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool onChange = false;
  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context);
    DbProvider _db = Provider.of<DbProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetails(
                  title: widget.title,
                  disc: widget.disc,
                  todoId: widget.todoId),
            )),
        child: Card(
          elevation: 5,
          child: CheckboxListTile(
            title: widget.isCompleted!
                ? Text(
                    '${widget.title}',
                    style: checkTrueText,
                  )
                : Text(
                    '${widget.title}',
                    style: checkFalseText,
                  ),
            subtitle: widget.isCompleted!
                ? Text(
                    '${widget.disc}',
                    style: checkTrueSubtitle,
                  )
                : Text(
                    '${widget.disc}',
                    style: checkFalseSubtitle,
                  ),
            value: widget.isCompleted,
            onChanged: (bool? value) {
              setState(() {
                onChange = value!;
              });
              Todo todo = Todo(isCompleted: onChange, todoId: widget.todoId);
              _db.updateTodo(todo, _auth.uid);
            },
          ),
        ),
      ),
    );
  }
}
