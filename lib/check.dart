import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class CheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> get createState => CheckPageState();
}

class CheckPageState extends State<CheckPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  String ans = "";
  String ekhatanumber = "";
  String pincode = "";
  String registrationnumber = "";
  String ownernumber = "";
  String status = "";
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Check Details"),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Column(children: <Widget>[
              Expanded(
                child: TextField(
                  controller: controller1,
                  obscureText: false,
                  decoration: InputDecoration(labelText: "Enter EKhata No."),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller2,
                  obscureText: false,
                  decoration: InputDecoration(labelText: " Enter PINCODE"),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller3,
                  obscureText: false,
                  decoration:
                      InputDecoration(labelText: "Enter Registration Number"),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller4,
                  obscureText: false,
                  decoration: InputDecoration(labelText: "Enter Owner Name"),
                ),
              ),
              Expanded(
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      dofunction();
                    },
                    child: Text("Check"),
                    hoverColor: Colors.black,
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  void dofunction() {
    int flag = 0;
    ekhatanumber = controller1.text.toString();
    pincode = controller2.text.toString();
    registrationnumber = controller3.text.toString();
    ownernumber = controller4.text.toString();
    ans = ekhatanumber + pincode + registrationnumber + ownernumber;
    String checkhashvalue = sha1.convert(utf8.encode(ans)).toString();
    FirebaseFirestore.instance
        .collection("PropertyData")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        if (checkhashvalue == result.data()["HashValue"] &&
            result.data()["Status"] == "For Sale" &&
            flag == 0) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Status"),
                  content: Text("The Project is on Sale" + status),
                );
              });
          flag = 1;
        } else if (flag == 0) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Status"),
                  content: Text(
                      "The Project is already sold.! Report to the seller" +
                          status),
                );
              });
        }
      });
    });
  }
}
