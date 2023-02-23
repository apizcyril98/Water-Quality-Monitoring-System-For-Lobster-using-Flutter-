import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';




class NhData extends StatefulWidget {
  @override
  _NhData createState() => _NhData();
}
class _NhData extends State<NhData> {
  double pH;
  String tan;
  double i;
  double p;






  final databaseRef = FirebaseDatabase(databaseURL:"https://fyp2022-2046f-default-rtdb.asia-southeast1.firebasedatabase.app/").reference();

  @override
  void initState() {
    super.initState();
    databaseRef.child('Data').onValue.listen((event) {
      setState(() {
        pH = event.snapshot.value['PH'] as double;
        tan = event.snapshot.value['TAN'];

        var value = pH;
        p = (value + 1.20);
        var valuetan = double.parse(tan);
        if (p <= 6.49){
          return i = (0.0007 * valuetan);
        }else if (6.50 <= p && p <= 6.99) {
          return i = (0.0022 * valuetan);
        }else if (7.00 <= p && p <= 7.49){
          return i = (0.0069 * valuetan);
        }else if (7.50 <= p && p <= 7.99){
          return i = (0.0217 * valuetan);
        }else if (8.00 <= p && p <= 8.49){
          return i = (0.0654 * valuetan);
        }else if (8.50 <= p && p <= 8.99){
          return i = (0.182 * valuetan);
        }else if (9.00 <= p && p <= 9.49){
          return i = (0.412 * valuetan);
        }else if (9.50 <= p && p <= 9.99){
          return i = (0.689 * valuetan);
        }else if (10.00 <= p){
          return i = (0.875 * valuetan);
        }
      });
    });

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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

                              SizedBox(width: 100),
                              Text(
                                "NH3: $i mg/L",
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
                "SAFE: BELOW 0.019 mg/L ",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green

                )),
            SizedBox(height: 30),
            SizedBox(width: 120),
            Text(
                "WARNING: ABOVE 0.05 mg/L ",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow

                )),
            SizedBox(height: 30),
            SizedBox(width: 120),
            Text(
                "DANGER: 2 mg/L ",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red

                ))


          ],
        ),
      )
    );
  }



}
