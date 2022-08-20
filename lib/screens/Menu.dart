import 'package:flutter/material.dart';
import 'package:my_work/screens/Attendance2.dart';
import 'package:my_work/screens/Contact.dart';
import 'package:my_work/screens/lab_verfication.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assessmart"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue),
              child: Column(
                children: [
                  Column(
                    children: [
                      IconButton(
                        iconSize: 130,
                        color: Colors.white,
                        splashColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Attendance2()));
                        },
                        icon: Icon(
                          Icons.library_books,
                          semanticLabel: "Attendance",
                        ),
                      ),
                      Text(
                        "Attendance",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.purple),
              child: Column(
                children: [
                  Column(
                    children: [
                      IconButton(
                        iconSize: 130,
                        color: Colors.white,
                        splashColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Lab_Home()));
                        },
                        icon: Icon(
                          Icons.keyboard,
                          semanticLabel: "Coding Lab",
                        ),
                      ),
                      Text(
                        "Coding Lab",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey),
              child: Column(
                children: [
                  Column(
                    children: [
                      IconButton(
                        iconSize: 130,
                        color: Colors.white,
                        splashColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contact()));
                        },
                        icon: Icon(
                          Icons.assignment_ind,
                          semanticLabel: "Contact",
                        ),
                      ),
                      Text(
                        "Contact",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
