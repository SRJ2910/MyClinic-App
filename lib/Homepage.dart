import 'dart:ui';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 300,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Container(
                    height: 2.0,
                    width: 2.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      // border: Border.all(color: const Color(0x33A6A6A6)),
                      color: Colors.black,
                      // borderRadius: BorderRadius.circular(12),
                      // border: Border.all(color: const Color(0xFF28324E)),
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage("img/fotu.jpg"),
                      // )
                    ),
                  )),
            ),
            ListTile(
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                );
              }),
              title: const Text(
                "Doctor",
                textScaleFactor: 1.5,
              ),
              subtitle: Text("Profile"),
              onTap: () {
                // Navigator.pushNamed(context, '/Detail');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.personal_injury_outlined),
                  onPressed: () {},
                );
              }),
              title: const Text(
                "Patient",
                textScaleFactor: 1.5,
              ),
              subtitle: Text("Details"),
              onTap: () {
                Navigator.pushNamed(context, '/Detail');
              },
            ),
            ListTile(
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.medical_services_rounded),
                  onPressed: () {},
                );
              }),
              title: const Text(
                "M.R. Visits",
                textScaleFactor: 1.5,
              ),
              subtitle: Text("Details"),
              onTap: () {
                Navigator.pushNamed(context, '/Mr_list');
              },
            ),
            Divider(),
            ListTile(
              title: const Text('''Version : 1.0.1
Contact :  @Suraj'''),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Container(
            // height: 600,
            child: Center(
              child: Container(
                // height: 200,
                // width: 200,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        // print("inkwell tap");
                        Navigator.pushNamed(context, '/Entry');
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.personal_injury_outlined,
                              size: 160,
                            ),
                            Text(
                              "Patient Entry",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // height: 100,
                        // width: 100,
                      ),
                      // splashColor: Colors.red,
                      // highlightColor: Colors.red,
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        // print("inkwell tap 2");
                        Navigator.pushNamed(context, '/Mr_entry');
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.medical_services_rounded,
                              size: 160,
                            ),
                            Text(
                              "M.R. Entry",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // height: 100,
                        // width: 100,
                      ),
                      // splashColor: Colors.green,
                      // highlightColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
