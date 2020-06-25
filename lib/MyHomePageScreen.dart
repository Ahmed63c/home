import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyHomePageScreen extends StatefulWidget {
  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<MyHomePageScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body:
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 35),
                          child: Image.asset("assets/logo.png"),
                          alignment: Alignment.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 90.0, left: 15.0, right: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0)),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.orange),
                                ),
                                contentPadding: EdgeInsets.only(top: 16.0),
                                fillColor: Colors.white,
                                hintText: 'What Are you looking for ?',
                                hintStyle: TextStyle(
                                    fontFamily: 'Cairo', fontSize: 18.0),
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.grey),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 40,
                      child: TabBar(
                          controller: _tabController,
                          indicatorColor: Colors.transparent,
                          labelColor: Colors.orange,
                          isScrollable: true,
                          labelPadding: EdgeInsets.only(right: 22.0, left: 22),
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: Text('All',
                                  style: TextStyle(
                                      fontFamily: "Cairo",
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Tab(
                              child: Text('Adds',
                                  style: TextStyle(
                                      fontFamily: "Cairo",
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Tab(
                              child: Text("Agencies",
                                  style: TextStyle(
                                      fontFamily: "Cairo",
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Tab(
                              child: Text('catagories',
                                  style: TextStyle(
                                      fontFamily: "Cairo",
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Tab(
                              child: Text('Services',
                                  style: TextStyle(
                                      fontFamily: "Cairo",
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold)),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                )
              ],
            ),
            Flexible(child: buildGrid(context))
          ],
        ));
  }

  @override
  Widget buildGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
           Container(
            margin: EdgeInsets.only(left: 15,right: 15),

            child: Text(
              "All cars",
              style: TextStyle(
                  fontSize: 25, fontFamily: "Cairo", fontWeight: FontWeight.w700),
            ),
          ),
        Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 15,
          endIndent: 15,
        ),
            Flexible(
        child: GridView.count(
          padding: EdgeInsets.only(left: 5,right: 5),
          crossAxisCount: 2,
          shrinkWrap: true,
          children: <Widget>[
            buildTile(
              context,
              0,
              "Cars",
              Image.asset(
                "assets/car2.jpg",
                fit: BoxFit.fill,
              ),
            ),
            buildTile(
              context,
              1,
              "Maintainance",
              Image.asset(
                "assets/car1.jpg",
                fit: BoxFit.fill,
              ),
            ),
            buildTile(
              context,
              2,
              "Agencies",
              Image.asset(
                "assets/car3.jpg",
                fit: BoxFit.fill,
              ),
            ),
            buildTile(
              context,
              3,
              "Accessiories",
              Image.asset(
                "assets/car5.jpg",
                fit: BoxFit.fill,
              ),
            ),
            buildTile(
              context,
              4,
              "Spare cuts",
              Image.asset(
                "assets/car1.jpg",
                fit: BoxFit.fill,
              ),
            ),
            buildTile(
              context,
              5,
              "Rent",
              Image.asset(
                "assets/car2.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      )
    ],);

  }

  int _selectedIndex = -1;

  @override
  Widget buildTile(
    BuildContext context,
    int index,
    String heading,
    Image image,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: index == 0 || index == 2 || index == 4 ? 4 : 2,
              top: 0,
              right: index == 1 || index == 3 || index == 5 ? 4 : 2,
              bottom: index == 4 || index == 5 ? 0 : 0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                print("tapped");
              },
              child: Container(
                height: 125,
                child: Card(
                  elevation: 2,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: _selectedIndex == index
                              ? Colors.orange
                              : Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child: image,
                ),
              )),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                left: index == 0 || index == 2 || index == 4 ? 8 : 4,
                top: 0,
                right: index == 1 || index == 3 || index == 5 ? 8 : 4,
                bottom: index == 4 || index == 5 ? 0 : 0),
            child: Text(
              heading,
              style: TextStyle(
                  fontSize: 21, fontFamily: "Cairo", fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}