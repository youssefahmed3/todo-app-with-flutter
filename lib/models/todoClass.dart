import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String? title;
  String? todoId;
  String? disc;
  bool? isCompleted;

  Todo({this.title, this.todoId, this.disc, this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      'todoId': todoId,
      'todoTitle': title,
      'todoDiscription': disc,
    };
  }

  Todo.fromFirestore(Map firestore) {
    todoId = firestore['todoId'];
    title = firestore['todoTitle'];
    disc = firestore['todoDiscription'];
  }
}
