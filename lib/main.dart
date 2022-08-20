import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_work/screens/flogin.dart';
import 'package:my_work/screens/home.dart';
import 'package:my_work/screens/login.dart';
import 'package:my_work/screens/register.dart';
import 'package:flutter/material.dart';

//import 'Attendace.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //       apiKey: "", appId: "", messagingSenderId: "", projectId: ""),
  // );
  // Obtain a list of the available cameras on the device.
  //final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  //final firstCamera = cameras.first;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      routes: {
        '/': (context) => const Home(),
        '/home': (context) => const Home(),
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/flogin': (context) => const FLogin(),
      },
    );
  }
}
