import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DoData extends StatefulWidget {
  @override
  _DoData createState() => _DoData();
}
class _DoData extends State<DoData> {
  double dO;

  final databaseRef = FirebaseDatabase(databaseURL:"https://fyp2022-2046f-default-rtdb.asia-southeast1.firebasedatabase.app/").reference();

  @override
  void initState() {
    super.initState();
    databaseRef.child('Data').onValue.listen((event) {
      setState(() {
        dO = event.snapshot.value['DO'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 100),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: SizedBox(
              height: 10,
              width: 10,
              child: OverflowBox(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 0.0,
                maxHeight: (MediaQuery.of(context).size.height / 4),
                child: Stack(children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: 400,
                    height: 90,
                    child: Card(
                      child: Center(
                        child: Row(
                          children: <Widget>[

                            SizedBox(width: 120),
                            Text(
                              "DO: ${dO.toStringAsFixed(2)} mg/L",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            )
                          ],
                        ),
                      ),
                      color: Colors.teal[50],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(height: 100),
          SizedBox(width: 120),
          Text(
              "SAFE: 5mg/L & ABOVE",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[600]

              )),
          SizedBox(height: 30),
          SizedBox(width: 120),
          Text(
              "DANGER: BELOW 4mg/L ",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red

              ))


        ],
      ),
    );
  }
}