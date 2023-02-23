import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lobster_meter/tan_api.dart';
import 'package:lobster_meter/generate_nh.dart';


class AmmoniaData extends StatefulWidget {
  @override
  _AmmoniaData createState() => _AmmoniaData();
}
class _AmmoniaData extends State<AmmoniaData> {
  double pH;

  final databaseRef = FirebaseDatabase(databaseURL:"https://fyp2022-2046f-default-rtdb.asia-southeast1.firebasedatabase.app/").reference();

  @override
  void initState() {
    super.initState();
    databaseRef.child('Data').onValue.listen((event) {
      setState(() {
        pH = event.snapshot.value['PH'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TanInsert(),
            SizedBox(height: 50),
            NhData()
          ],
        ),
      )
    );
  }
}