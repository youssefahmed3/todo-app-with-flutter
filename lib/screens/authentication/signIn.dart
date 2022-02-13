import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_no_signin/provider/auth_provider.dart';
import 'package:todo_app_no_signin/provider/db_provider.dart';
import 'package:todo_app_no_signin/screens/mainPage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context);
    DbProvider _db = Provider.of<DbProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('sign in'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign In To The App'),
          onPressed: () async {
            await _auth.signInAon();
            await _db.getTodos(_auth.uid);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainPage()),
                (route) => false);

            // print(_auth.uid);
          },
        ),
      ),
    );
  }
}
