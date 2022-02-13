import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_no_signin/models/todoCard.dart';
import 'package:todo_app_no_signin/provider/auth_provider.dart';
import 'package:todo_app_no_signin/provider/db_provider.dart';
import 'package:todo_app_no_signin/service/db_Service.dart';

class Completed extends StatefulWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  bool isCheckboxTrue = true;
  @override
  Widget build(BuildContext context) {
    DbProvider _db = Provider.of<DbProvider>(context);
    Auth _auth = Provider.of<Auth>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: DatabaseService()
          .todos
          .doc(_auth.uid)
          .collection('todo')
          .where('isCompleted', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return TodoCard(
                title: snapshot.data?.docs[index].get('title'),
                disc: snapshot.data?.docs[index].get('discription'),
                todoId: snapshot.data?.docs[index].get('todoId'),
                isCompleted: snapshot.data?.docs[index].get('isCompleted'),
                isCheckboxChange: true,
              );
            },
          );
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}
