import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TanInsert extends StatefulWidget{

  @override
  _TanInsert createState() => _TanInsert();
}
class _TanInsert extends State<TanInsert>{

  final databaseRef = FirebaseDatabase(databaseURL:"https://fyp2022-2046f-default-rtdb.asia-southeast1.firebasedatabase.app/").reference();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: SafeArea(
        child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index)
            {


              return ListTile(
                title: Text("Total Ammonia Nitrogen (TAN)"),
                subtitle: Text(snapshot.value['TAN'].toString()),
                trailing: IconButton(
                  onPressed: () {
                    //var key = snapshot.key;
                    //print(key);
                    updateDialog(snapshot.value['TAN'].toString(), context, snapshot.key);
                  },
                  icon: Icon(Icons.edit)),
                );

            }
        )
      )
    );
  }

  Future<void> updateDialog(String tan, BuildContext context, var key){
    var tanController = TextEditingController(text:tan);
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Update Value"),
          content: Column(
            children: [
              TextFormField(
                controller: tanController,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: "TAN value"),
              )
            ],
          ),
          actions: [
            TextButton(onPressed: (){
              updateData(tanController.text, key);
              Navigator.of(context).pop();
            }, child: Text("Update")),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
              }, child: Text("Cancel"))
          ],
        );
      }
    );
  }

  void updateData(String tan, var key){
    Map<String, dynamic> x= {"TAN": tan};
    databaseRef.child(key).update(x);
  }

}