import 'package:flutter/material.dart';
import 'package:my_work/screens/flogin.dart';
import 'package:my_work/screens/login.dart';
import 'package:my_work/screens/register.dart';

class Home extends StatefulWidget {
  const Home({Key? key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('SmartAccess'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          if (MediaQuery.of(context).size.width > 600)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  FloatingActionButton.extended(
                      heroTag: 'aregbtn',
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      backgroundColor: Colors.green,
                      //icon: const Icon(Icons.app_registration),
                      label: const Text('SignUp')),
                  const SizedBox(width: 10),
                  FloatingActionButton.extended(
                      heroTag: 'alogbtn',
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      //icon: const Icon(Icons.login),
                      backgroundColor: Color.fromARGB(255, 30, 115, 233),
                      label: const Text('Login')),
                ],
              ),
            ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return wideHomeContainers(context);
          } else {
            return normalHomeContainer(context);
          }
        },
      ),
    );
  }
}

Widget normalHomeContainer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FloatingActionButton.extended(
            heroTag: 'regbtn',
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Register()));
            },
            backgroundColor: Colors.deepPurple,
            icon: const Icon(Icons.app_registration),
            label: const Text('Sign Up')),
        const SizedBox(
          height: 20,
          width: 0,
        ),
        FloatingActionButton.extended(
            heroTag: 'logbtn',
            onPressed: () {
              //Navigator.pushNamed(context, '/login');
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Login()));
            },
            icon: const Icon(Icons.login),
            label: const Text('Login')),
        const SizedBox(
          height: 20,
          width: 0,
        ),
        FloatingActionButton.extended(
            heroTag: 'flogbtn',
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new FLogin()));
            },
            icon: const Icon(Icons.perm_identity),
            label: const Text('Faculty Login'))
      ],
    ),
  );
}

Widget wideHomeContainers(BuildContext context) {
  return Center(
      child: Container(
          width: 400,
          color: Colors.grey[200],
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FloatingActionButton.extended(
                        heroTag: 'regbtn1',
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        backgroundColor: Colors.deepPurple,
                        icon: const Icon(Icons.app_registration),
                        label: const Text('Sign Up')),
                    const SizedBox(
                      height: 20,
                      width: 0,
                    ),
                    FloatingActionButton.extended(
                        heroTag: 'logbtn1',
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('Login')),
                    const SizedBox(
                      height: 20,
                      width: 0,
                    ),
                    FloatingActionButton.extended(
                        heroTag: 'flogbtn1',
                        onPressed: () {
                          Navigator.pushNamed(context, '/flogin');
                        },
                        icon: const Icon(Icons.perm_identity),
                        label: const Text('Faculty Login'))
                  ],
                ),
              ))));
}
