import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:register/mr_detail.dart';

class Mr_entry extends StatefulWidget {
  Mr_entry({Key? key}) : super(key: key);

  @override
  _Mr_entryState createState() => _Mr_entryState();
}

class _Mr_entryState extends State<Mr_entry> {
  final referenceDatabase = FirebaseDatabase.instance;

  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final productController = TextEditingController();
  // final dateController = TextEditingController();
  final idController = TextEditingController();
  String date =
      DateFormat('dd/MM/yyyy' + ' & ' + 'HH:mm').format(DateTime.now());

  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    final detail = ref.child('MR Detail');
    return Scaffold(
      appBar: AppBar(
        title: Text("M.R. Entry"),
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
                          hintText: "Enter visitor name"),
                    ),
                  ))
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    "Company : ",
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, top: 0, bottom: 0),
                    child: TextField(
                      controller: companyController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter company name"),
                    ),
                  ))
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    "Product : ",
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 0, top: 0, bottom: 0),
                    child: TextField(
                      controller: productController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter product name"),
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
            // ListTile(
            //   title: Row(
            //     children: [
            //       Text(
            //         "ID : ",
            //         textScaleFactor: 1.3,
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       Expanded(
            //           child: Padding(
            //         padding: const EdgeInsets.only(
            //             left: 55, right: 0, top: 0, bottom: 0),
            //         child: TextFormField(
            //           // controller: dateController,
            //           initialValue: "$id",
            //           readOnly: true,
            //           decoration: InputDecoration(border: OutlineInputBorder()),
            //         ),
            //       ))
            //     ],
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 25, bottom: 0),
              child: Container(),
            ),
            ElevatedButton(
                onPressed: () {
                  // ref.child('Patient Detail').push();
                  if (nameController.text.isEmpty ||
                      companyController.text.isEmpty ||
                      productController.text.isEmpty) {
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
                            companyController.text +
                            "\n" +
                            productController.text +
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
                        .child('Company')
                        .push()
                        // .child('Address')
                        .set(companyController.text)
                        .asStream();

                    detail
                        .child('Product')
                        .push()
                        // .child('Address')
                        .set(productController.text)
                        .asStream();

                    detail
                        .child('Date')
                        .push()
                        // .child('Date')
                        .set(date)
                        .asStream();
                  }

                  nameController.clear();
                  companyController.clear();
                  productController.clear();
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
                          type: PageTransitionType.rightToLeft,
                          child: Mr_list()));
                },
                child: Text("Show M.R. List"))
          ],
        ),
      ),
    );
  }
}
