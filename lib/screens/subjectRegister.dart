import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_work/screens/dashboard.dart';

class subjectRegister extends StatefulWidget {
  const subjectRegister({Key? key}) : super(key: key);

  @override
  State<subjectRegister> createState() => _subjectRegisterState();
}

class _subjectRegisterState extends State<subjectRegister> {
  List typeofregister = ["Theory", "Lab"];

  String? _groupValue;
  @override
  String? section = 'Section 1', Branch = 'CSE', Subject = 'DIP', year = 'E3';
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Subject Registration"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.home)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: Text('year :')),
              const SizedBox(width: 5),
              Expanded(
                child: DropdownButton(
                  value: year,
                  borderRadius: BorderRadius.circular(8.0),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.black26,
                  ),
                  items: <String>['PUC1', 'PUC2', 'E1', 'E2', 'E3', 'E4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      year = newValue!;
                    });
                  },
                  isExpanded: true,
                ),
              )
            ],
          ),
          SizedBox(
            height: height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: Text('Branch :')),
              const SizedBox(width: 5),
              Expanded(
                child: DropdownButton(
                  value: Branch,
                  borderRadius: BorderRadius.circular(8.0),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.black26,
                  ),
                  items: <String>[
                    'CSE',
                    'ECE',
                    'EEE',
                    'Mech',
                    'Chem',
                    'CIVIL',
                    'MME'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      Branch = newValue!;
                    });
                  },
                  isExpanded: true,
                ),
              )
            ],
          ),
          SizedBox(
            height: height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: Text('Section :')),
              const SizedBox(width: 5),
              Expanded(
                child: DropdownButton(
                  value: section,
                  borderRadius: BorderRadius.circular(8.0),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.black26,
                  ),
                  items: <String>[
                    'Section 1',
                    'Section 2',
                    'Section 3',
                    'Section 4',
                    'Section 5',
                    'Section 6'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      section = newValue!;
                    });
                  },
                  isExpanded: true,
                ),
              )
            ],
          ),
          SizedBox(
            height: height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: Text('Subject :')),
              const SizedBox(width: 5),
              Expanded(
                child: DropdownButton(
                  value: Subject,
                  borderRadius: BorderRadius.circular(8.0),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.black26,
                  ),
                  items: <String>[
                    'DIP',
                    'CDC',
                    'CNS',
                    'Data Science',
                    'Matrix Algebra',
                    'ST',
                    'Telugu'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      Subject = newValue!;
                    });
                  },
                  isExpanded: true,
                ),
              )
            ],
          ),
          SizedBox(
            height: height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: Text('Subject :')),
              const SizedBox(width: 5),
              Expanded(
                child: DropdownButton(
                  value: _groupValue,
                  borderRadius: BorderRadius.circular(8.0),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.black26,
                  ),
                  items: <String>[
                    'Theory',
                    'Lab',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _groupValue = newValue!;
                    });
                  },
                  isExpanded: true,
                ),
              )
            ],
          ),
          SizedBox(
            height: height / 10,
          ),
          ElevatedButton(
            child: Text("Register Subject"),
            onPressed: () {
              showConfirmDialog(context);
            },
          )
        ],
      ),
    );
  }

  void showConfirmDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure you want to register for the subject?"),
            actions: [
              TextButton(onPressed: () {}, child: Text("Yes")),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"),
              )
            ],
          );
        });
  }
}
