import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_fraud_detection/add.dart';
import 'package:real_estate_fraud_detection/check.dart';
import 'package:real_estate_fraud_detection/StatusAuthentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(homepage());
}

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepagedisplay(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class homepagedisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Real Estate Fraud Detection"),
      ),
      body: Center(
          child: Text("Welcome, choose your desired option from the menu")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Icon(
                Icons.escalator_warning,
              ),
            ),
            ListTile(
              title: const Text("Check"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CheckPage();
                }));
              },
            ),
            ListTile(
              title: const Text("Add"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddPage();
                }));
              },
            ),
            ListTile(
              title: const Text("Change Status"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Status();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
