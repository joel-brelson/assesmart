import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_work/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
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
                  Icons.app_registration,
                  color: Colors.indigo,
                ),
                title: const Text('Sign Up'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.login,
                  color: Colors.green,
                ),
                title: const Text('Login'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.code,
                  color: Colors.pinkAccent,
                ),
                title: const Text('Coding Lab'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/coding_lab');
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
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/register_attendence');
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
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/attendance');
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Hello ${loggedInUser.userId}"),
      ),
    );
  }
}
