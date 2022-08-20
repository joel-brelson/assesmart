import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_work/screens/dashboard.dart';
import 'package:my_work/screens/home.dart';
import 'package:my_work/screens/home_screen.dart';
import 'package:my_work/screens/register_attendence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'register.dart';
import 'package:my_work/Attendace.dart';
import 'coding_lab.dart';
import 'dart:io';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Dashboard"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 70,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Assessmart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.code,
                  color: Colors.pinkAccent,
                ),
                title: const Text('Coding Lab'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CodingLab()));
                  //Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.app_registration_rounded,
                  color: Colors.teal,
                ),
                title: const Text('Attendance Registration'),
                onTap: () {
                  //Navigator.pop(context);
                  //Navigator.pushNamed(context, '/register_attendence');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterAttendence()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                  color: Colors.red,
                ),
                title: const Text('Attendance'),
                onTap: () {
                  //Navigator.pop(context);
                  // Navigator.pushNamed(context, '/attendance');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Attendance(img: null)));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.login,
                  color: Colors.green,
                ),
                title: const Text('LogOut'),
                onTap: () {
                  signOut();
                  //Navigator.pop(context, false);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Home()),
                  // );
                  //Navigator.pop(context);
                  // Navigator.pushNamed(context, '/login');
                  // Navigator.push(
                  //  context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
