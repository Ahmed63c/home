import 'package:flutter/material.dart';
import 'package:home/MyHomePageScreen.dart';

import 'bottom_bar.dart';
import 'cookie_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo',
          primaryColor: Colors.orange,
          primaryColorDark: Colors.black
      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0.0,
//        centerTitle: false,
//        leading: IconButton(
//          icon: Icon(Icons.directions_car, color: Color(0xFFF17532)),
//          onPressed: () {},
//        ),
//        title: Text('AutoMotor',
//            textAlign: TextAlign.center,
//            style: TextStyle(
//                fontFamily: 'Varela',
//                fontSize: 20.0,
//                color: Color(0xFF545D68))),
////        actions: <Widget>[
////          IconButton(
////            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
////            onPressed: () {},
////          ),
////        ],
//      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 0.0),
          Flexible(
            child: Container(
                height: MediaQuery.of(context).size.height - 30,
                width: double.infinity,
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      MyHomePageScreen(),
                      CookiePage(),
                      CookiePage(),
                      CookiePage(),
                      CookiePage()
                    ]
                )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
