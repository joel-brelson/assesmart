import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_work/screens/login_screen.dart';

// ignore: non_constant_identifier_names
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //       apiKey: "", appId: "", messagingSenderId: "", projectId: ""),
  // );
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.redAccent,
  //       title: const Text("Login to Your Account"),
  //       centerTitle: true,
  //     ),
  //     backgroundColor: Colors.white,
  //     body: SingleChildScrollView(
  //       child: ConstrainedBox(
  //         constraints: const BoxConstraints(),
  //         child: const Padding(
  //           padding: EdgeInsets.all(30),
  //           child: LoginScreen(),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
