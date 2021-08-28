import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StatusChange extends StatelessWidget {
  String hashvalue = "";
  var documentid;
  StatusChange({this.hashvalue, this.documentid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChangeStatus"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
                "The Status is changed temporily, The new owners have to add property again"),
            Expanded(
                child: Center(
              child: RaisedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("PropertyData")
                      .doc(documentid)
                      .update({"Status": "Sold"});
                },
                child: Text("Change Status"),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
