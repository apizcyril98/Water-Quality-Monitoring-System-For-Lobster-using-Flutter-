import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lobster_meter/ph_data.dart';
import 'package:lobster_meter/do_data.dart';
import 'package:lobster_meter/ammonia_data.dart';

class HomePage extends StatefulWidget {
  @override

  _HomePage createState() => _HomePage();
  }



class _HomePage extends State<HomePage> with TickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }
  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 1));
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.blue;
                } if (states.contains(MaterialState.focused)) {
                  return Colors.orange;
                } else if (states.contains(MaterialState.hovered)) {
                  return Colors.pinkAccent;
                }

                return Colors.transparent;
              }),
              indicatorWeight: 10,
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(5),
              indicator: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
                color: Colors.pinkAccent,
              ),
              isScrollable: true,
              physics: BouncingScrollPhysics(),
              onTap: (int index) {
                print('Tab $index is tapped');
              },
              enableFeedback: true,
              // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
              // controller: _tabController,
              tabs: [
                Tab(text: 'PH'),
                Tab(text: 'DO'),
                Tab(text: 'NH3'),

              ]
            ),
            title: const Text('LOBSTER IOT METER'),
            backgroundColor: Colors.teal,
          ),
          body:  TabBarView(
            physics: BouncingScrollPhysics(),
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
            children: <Widget>[
              PhData(),
              DoData(),
              AmmoniaData()
            ],
          ),
        ),
      ),
    );
  }
}
