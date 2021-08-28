import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:real_estate_fraud_detection/Statuschange.dart';

class Status extends StatefulWidget {
  @override
  State<StatefulWidget> get createState => StatusState();
}

class StatusState extends State<Status> {
  TextEditingController _controller = TextEditingController();
  String check = "";
  bool flag = false;
  var senddocumentid;
  final key = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    check1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBar(
          title: Text("Change Status"),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Center(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Enter the unique hash for Authentication"),
                  controller: _controller,
                ),
              ),
              Expanded(
                  child: Center(
                child: RaisedButton(
                  onPressed: () {
                    if (check1() == true) {
                      key.currentState.showSnackBar(new SnackBar(
                        content: Text("HashValue Authenticated"),
                      ));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StatusChange(
                            documentid: senddocumentid, hashvalue: check);
                      }));
                    } else {
                      key.currentState.showSnackBar(new SnackBar(
                        content: Text("HashValue Not Authenticated..TRY AGAIN"),
                      ));
                    }
                  },
                  child: Text("Submit"),
                ),
              ))
            ],
          ),
        ));
  }

  bool check1() {
    check = _controller.text.toString();
    FirebaseFirestore.instance
        .collection("PropertyData")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        if (check == result.data()["HashValue"] &&
            result.data()["Status"] == "For Sale") {
          var tempdocumentid = result.id;
          bool temp = true;
          setState(() {
            flag = temp;
            senddocumentid = tempdocumentid;
          });
        }
      });
    });
    return flag;
  }
}
