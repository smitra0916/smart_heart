import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:smart_heart/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Smart Heart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Smart Heart'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  String sex = '';
  int age = 0;
  int pulse = 0;
  int spo2 = 0;
  int cbg = 0;
  String bp = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('dGuo1yzC2ciSvzLGo37p')
        .get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    setState(() {
      name = data['Name'];
      sex = data['Sex'];
      age = data['Age'];
      pulse = data['Pulse'];
      spo2 = data['SPO2'];
      cbg = data['CBG'];
      bp = data['BP'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100.0, left: 20),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            CircleAvatar(
              radius: 90,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'NAME: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(name, style: TextStyle(fontSize: 20))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      sex.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(age.toString(), style: TextStyle(fontSize: 20))
                  ],
                )
              ],
            ),
          ]),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.monitor_heart_rounded),
                      Text(
                        'PULSE:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        pulse.toString(),
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.monitor_heart_rounded),
                      Text(
                        'SPO2:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        spo2.toString(),
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.monitor_heart_rounded),
                      Text(
                        'CBG:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        cbg.toString(),
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.monitor_heart_rounded),
                      Text(
                        'BP:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        bp,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
