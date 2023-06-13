import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Mr_list extends StatefulWidget {
  Mr_list({Key? key}) : super(key: key);

  @override
  _Mr_listState createState() => _Mr_listState();
}

class _Mr_listState extends State<Mr_list> {
  String value = "MR Detail/All";
  int no = 1;
  bool _reverse = true;
  var _key = Key('Last');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("M.R. List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 35.0, right: 35.0, top: 20, bottom: 10),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // value = "Patient Detail/Date";
                        no = 1;
                        _key = Key('last');
                      });
                    },
                    child: Text("Last")),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 59.0, right: 59.0, top: 0, bottom: 0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // value = "Patient Detail/Date";
                          _reverse = true;
                          no = 7;
                          _key = Key('recent');
                        });
                      },
                      child: Text("Recent")),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        no = 1000;
                        _reverse = false;
                        _key = Key('All');
                      });
                    },
                    child: Text("All")),
              ],
            ),
          ),
          new Flexible(
              child: new FirebaseAnimatedList(
                  shrinkWrap: true,
                  reverse: _reverse,
                  padding: const EdgeInsets.only(
                      left: 35, right: 35, top: 0, bottom: 20),
                  key: _key,
                  query: FirebaseDatabase.instance
                      .reference()
                      .child(value)
                      .limitToLast(no),
                  defaultChild: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animataion, int index) {
                    return Container(
                      child: Column(
                        children: [
                          new Divider(
                            thickness: 2,
                          ),
                          new ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 35,
                            ),
                            title: new Text(
                              snapshot.value,
                              textScaleFactor: 1.02,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
