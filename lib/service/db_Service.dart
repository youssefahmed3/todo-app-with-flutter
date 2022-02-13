import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:todo_app_no_signin/models/todoClass.dart';

class DatabaseService {
  CollectionReference todos = FirebaseFirestore.instance.collection('todos');
  String? uid;
  var uuid = Uuid();

  Future getTodos(String uid) {
    return todos.doc(uid).collection('todo').get();
  }

  Future saveTodo(Todo todo, String uid) async {
    await todos.doc(uid).collection('todo').doc(todo.todoId).set({
      'title': todo.title,
      'todoId': todo.todoId,
      'discription': todo.disc,
      'isCompleted': false,
    });
  }

  Future updateTodo(Todo todo, String uid) async {
    await todos.doc(uid).collection('todo').doc(todo.todoId).update({
      'isCompleted': todo.isCompleted,
    });
  }

  Future deleteTodo(Todo todo, String uid) async {
    await todos.doc(uid).collection('todo').doc(todo.todoId).delete();
  }
}
