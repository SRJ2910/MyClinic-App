import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:register/detail.dart';

class Entrie2 extends StatefulWidget {
  Entrie2({Key? key}) : super(key: key);

  // @override
  _Entrie2State createState() => _Entrie2State();
}

class _Entrie2State extends State<Entrie2> {
  final referenceDatabase = FirebaseDatabase.instance;

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final idController = TextEditingController();
  String date =
      DateFormat('dd/MM/yyyy' + ' & ' + 'HH:mm').format(DateTime.now());

  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    final detail = ref.child('Patient Detail');
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry2.0"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30.0, right: 25.0, top: 45, bottom: 0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    "Name : ",
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 0, top: 0, bottom: 0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter patient name"),
                    ),
                  ))
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    "Address : ",
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 0, top: 0, bottom: 0),
                    child: TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter patient address"),
                    ),
                  ))
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    "Time : ",
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 49, right: 0, top: 0, bottom: 0),
                    child: TextFormField(
                      // controller: dateController,
                      initialValue: "$date",
                      readOnly: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "$date"),
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 25, bottom: 0),
              child: Container(),
            ),
            ElevatedButton(
                onPressed: () {
                  // ref.child('Patient Detail').push();
                  if (nameController.text.isEmpty ||
                      addressController.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Try Again !!!",
                      // toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      backgroundColor: Colors.grey,
                      // textColor: Colors.red,
                      // fontSize: 16.0
                    );
                  } else {
                    detail
                        .child('All')
                        .push()
                        .set(nameController.text +
                            "\n" +
                            addressController.text +
                            "\n" +
                            date)
                        .asStream();
                    detail
                        .child('Name')
                        .push()
                        // .child('Address')
                        .set(nameController.text)
                        .asStream();

                    detail
                        .child('Address')
                        .push()
                        // .child('Address')
                        .set(addressController.text)
                        .asStream();

                    detail
                        .child('Date')
                        .push()
                        // .child('Date')
                        .set(date)
                        .asStream();
                  }

                  nameController.clear();
                  addressController.clear();
                  // id++;
                  // _incrementCounter();
                },
                child: Text("Submit")),
            SizedBox(
              height: 15,
            ),
            // Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: Detail(),
                          type: PageTransitionType.rightToLeft));
                },
                child: Text("Show Detail"))
          ],
        ),
      ),
    );
  }
}
