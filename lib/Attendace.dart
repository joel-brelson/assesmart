import 'dart:ui';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_work/models/Information.dart';
import 'package:my_work/models/UserAttendanceModel.dart';
import 'package:my_work/models/usermodel.dart';
import 'package:my_work/screens/takepicturescreen.dart';

class Attendance extends StatefulWidget {
  const Attendance({
    key,
    required this.img,
  });
  final XFile? img;
  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  String? subj, Period;
  final OtpController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  UserAttendanceModel usr_record = UserAttendanceModel();
  DocumentReference? user_db;
  UserModel loggedinuser = new UserModel();

  @override
  void initState() {
    super.initState();
    user_db = FirebaseFirestore.instance.collection("users").doc(user!.uid);

    user_db!.get().then((value) {
      this.loggedinuser = UserModel.fromMap(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 96, 96, 96)),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Flexible(
                flex: 4,
                child: (widget.img == null)
                    ? Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: IconButton(
                          color: Colors.teal,
                          hoverColor: Colors.blueGrey,
                          onPressed: () async {
                            WidgetsFlutterBinding.ensureInitialized();
                            // Obtain a list of the available cameras on the device.
                            final cameras = await availableCameras();
                            // Get a specific camera from the list of available cameras.
                            late CameraDescription firstCamera;
                            if (cameras.length >= 2) {
                              firstCamera = cameras[1];
                            } else {
                              firstCamera = cameras[0];
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TakePictureScreen(
                                        key: null, camera: firstCamera)));
                          },
                          icon: Icon(Icons.camera_alt),
                          iconSize: 40,
                        )),
                      )
                    : Container(
                        child: Image.file(File(widget.img!.path)),
                      )),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                child: DropdownButton(
                    dropdownColor: Colors.blueGrey,
                    value: subj,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                    elevation: 15,
                    borderRadius: BorderRadius.circular(10.0),
                    isExpanded: true,
                    iconEnabledColor: Color.fromARGB(255, 69, 58, 58),
                    //borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    underline: Container(),
                    alignment: Alignment.topCenter,
                    menuMaxHeight: 150.0,
                    hint: Text(
                      "--  subject  --",
                      style: TextStyle(color: Colors.black),
                    ),
                    items: sampleData.Subjects.map((itemsname) {
                      return (DropdownMenuItem(
                        child: Text(
                          itemsname,
                          style: TextStyle(color: Colors.blue),
                        ),
                        value: itemsname,
                      ));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        subj = newValue!;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                child: DropdownButton(
                    dropdownColor: Colors.blueGrey,
                    value: Period,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                    elevation: 15,
                    borderRadius: BorderRadius.circular(10.0),
                    isExpanded: true,
                    iconEnabledColor: Color.fromARGB(255, 69, 58, 58),
                    underline: Container(),
                    alignment: Alignment.topCenter,
                    menuMaxHeight: 150.0,
                    hint: Text(
                      "--  Period  --",
                      style: TextStyle(color: Colors.black),
                    ),
                    items: sampleData.Periods.map((itemsname) {
                      return (DropdownMenuItem(
                        child: Text(
                          itemsname,
                          style: TextStyle(color: Colors.blue),
                        ),
                        value: itemsname,
                      ));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        Period = newValue!;
                      });
                    }),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("OTP"),
                    ),
                  ),
                )),
            Flexible(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      AttendStore(Period!, subj!, OtpController.text);
                    },
                    child: Text("Submit Attendance"))),
          ],
        ),
      ),
    );
  }

  void AttendStore(String? _period, String? _subject, String? _otp) {
    DateTime now = new DateTime.now();
    String date = new DateTime(now.day, now.month, now.year).toString();
    usr_record.date = date;
    usr_record.Period = _period;
    usr_record.UserId = loggedinuser.userId;
    usr_record.UserName = loggedinuser.userName;
    usr_record.Section = loggedinuser.section;
    usr_record.Subject = _subject;
    usr_record.department = loggedinuser.department;
    usr_record.AId = "hello";
    user_db!.collection("Attendance-History").add(usr_record.toMap());
  }
}
