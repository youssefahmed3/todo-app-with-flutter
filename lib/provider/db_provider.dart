import 'package:flutter/material.dart';
import 'package:todo_app_no_signin/models/todoClass.dart';
import 'package:todo_app_no_signin/service/db_Service.dart';

class DbProvider extends ChangeNotifier {
  var _db = DatabaseService();
  static String? uid;

  saveTodo(Todo todo, String? uid) {
    _db.saveTodo(todo, uid!);
    notifyListeners();
  }

  Future getTodos(String? uid) {
    return _db.getTodos(uid!);
    // notifyListeners();
  }

  updateTodo(Todo todo, String? uid) {
    _db.updateTodo(todo, uid!);
    notifyListeners();
  }

  deleteTodo(Todo todo, String? uid) {
    _db.deleteTodo(todo, uid!);
    notifyListeners();
  }
}
