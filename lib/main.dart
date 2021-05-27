import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    QuerySnapshot qn = await firestore.collection("Countries").get();

    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (_, snapshot) {
          if (snapshot.hasData){

            return ListView.builder(
              itemCount: snapshot.data.lenght,
              itemBuilder: (_, index) {
                DocumentSnapshot data = snapshot.data[index];

                return ListTile();
              },
            );
          }
            return
          Container();
        },
      ),
    );
  }
}
