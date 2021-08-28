import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> get createState => AddPageState();
}

class AddPageState extends State<AddPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  String ans = "";
  String ekhatanumber = "";
  String pincode = "";
  String registrationnumber = "";
  String ownernumber = "";
  String printhashvalue = "";
  String combined = "";
  var hashvalue;
  List<String> l = List();
  @override
  void initState() {
    super.initState();
    queryvalues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Property"),
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
                      InputDecoration(labelText: " Enter Registration Number"),
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
                      initializestring();
                      queryvalues();
                      addData();
                    },
                    child: Text("Submit"),
                    hoverColor: Colors.black,
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  void initializestring() {
    ekhatanumber = controller1.text.toString();
    pincode = controller2.text.toString();
    registrationnumber = controller3.text.toString();
    ownernumber = controller4.text.toString();
    combined = ekhatanumber + pincode + registrationnumber + ownernumber;
    hashvalue = sha1.convert(utf8.encode(combined));
    printhashvalue = hashvalue.toString();
  }

  void addData() {
    if (l.contains(printhashvalue) != true) {
      Map<String, dynamic> demodata = {
        "Ekhata Number": ekhatanumber,
        "HashValue": printhashvalue,
        "Name": ownernumber,
        "PINCODE": pincode,
        "RegistrationNumber": registrationnumber,
        "Status": "For Sale"
      };

      Map<String, dynamic> demodata1 = {"HashValue": printhashvalue};

      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('PropertyData');
      collectionReference.add(demodata);
      CollectionReference collectionReference1 =
          FirebaseFirestore.instance.collection('HashValues');
      collectionReference1.add(demodata1);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Status"),
              content: Text(
                  "Data Added Successfully into the Database. This is your UniqueHashValue Keep it Safe        " +
                      printhashvalue.toString()),
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Unsucessfull Attempt to Add Data"),
              content: Text("Data your trying to add is already present"),
            );
          });
    }
  }

  void queryvalues() {
    FirebaseFirestore.instance
        .collection("PropertyData")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        String temp = result.data()["HashValue"].toString();
        setState(() {
          l.add(temp);
        });
      });
    });
  }
}
