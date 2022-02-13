import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_no_signin/models/addTaskAlert.dart';
import 'package:todo_app_no_signin/provider/auth_provider.dart';
import 'package:todo_app_no_signin/screens/bottomNavBarPages/Homescreen.dart';
import 'package:todo_app_no_signin/screens/bottomNavBarPages/completed.dart';
import 'package:todo_app_no_signin/screens/bottomNavBarPages/notCompleted.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List pages = [
    const HomeScreen(),
    const Completed(),
    const NotCompleted(),
  ];

  /* @override
  initState() {
    super.initState();
  }
 */
  @override
  Widget build(BuildContext context) {
    // Auth user = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting
        backgroundColor: Colors.blue,
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Completed',
            icon: Icon(Icons.fact_check),
          ),
          BottomNavigationBarItem(
            label: 'Not completed',
            icon: Icon(Icons.fact_check_outlined),
          ),
        ],
      ),
      floatingActionButton: currentIndex < 1
          ? FloatingActionButton.extended(
              onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const AddTask(),
              ),
              label: const Text('Add Task'),
              icon: const Icon(Icons.add),
            )
          : null,
      body: pages[currentIndex],
    );
  }
}
