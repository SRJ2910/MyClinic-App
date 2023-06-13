// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register/Homepage.dart';
import 'package:register/detail.dart';
import 'package:register/entry.dart';
import 'package:register/mr_detail.dart';

import 'entry2.0.dart';
import 'mr_entry.dart';

// import 'package:register/detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _fbapp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        "/": (context) => Homepage(),
        "/Detail": (context) => Detail(),
        "/Entry": (context) => Entries(),
        // "/": (context) => Entrie2(),
        "/Mr_entry": (context) => Mr_entry(),
        "/Mr_list": (context) => Mr_list(),
      },
      // home: FutureBuilder(
      //   future: _fbapp,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       print("There is some error ${snapshot.error.toString()}");
      //       return Text("There is some error");
      //     } else if (snapshot.hasData) {
      //       return Entries();
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // )
      // home: ,
    );
  }
}
