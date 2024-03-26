import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100.0, left: 20),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            CircleAvatar(
              radius: 90,
            ),
            SizedBox(width: 20,),
            Column(
              children: [
                Row(
                  children: [
                    Text('NAME: ', style: TextStyle(fontSize: 20),),
                    Text('name', style: TextStyle(fontSize: 20))],
                ),
                Row(
                  children: [
                    Text('AGE: ', style: TextStyle(fontSize: 20),),
                    Text('age', style: TextStyle(fontSize: 20))],
                )
              ],
            ),
          ]),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Row(
                    children: [
                      Icon(Icons.monitor_heart_rounded),
                      Text('PULSE:', style: TextStyle(fontSize: 15),),
                      Text('age', style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Row(
                    children: [
                      Icon(Icons.monitor_heart_rounded),
                      Text('SPO2:', style: TextStyle(fontSize: 15),),
                      Text('age', style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Row(
                    children: [
                      Icon(Icons.monitor_heart_rounded),
                      Text('CBG:', style: TextStyle(fontSize: 15),),
                      Text('age', style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Row(
                    children: [
                      Icon(Icons.monitor_heart_rounded),
                      Text('BP:', style: TextStyle(fontSize: 15),),
                      Text('age:', style: TextStyle(fontSize: 15),)
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
