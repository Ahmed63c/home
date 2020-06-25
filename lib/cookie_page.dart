import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cookie_detail.dart';

class CookiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body:ListView(
                  children: <Widget>[
                    _buildCard('Cookie mint', '\$3.99', 'assets/car1.jpg', false, false, context),
                    _buildCard('Cookie mint', '\$3.99', 'assets/car2.jpg', false, false, context),
                    _buildCard('Cookie mint', '\$3.99', 'assets/car3.jpg', false, false, context),
                    _buildCard('Cookie mint', '\$3.99', 'assets/car4.webp', false, false, context),
                    _buildCard('Cookie mint', '\$3.99', 'assets/car5.jpg', false, false, context)

                  ],
                )
//              child: GridView.count(
//                crossAxisCount: 2,
//                primary: false,
//                crossAxisSpacing: 10.0,
//                mainAxisSpacing: 15.0,
//                childAspectRatio: 0.8,
//                children: <Widget>[
//                  _buildCard('Cookie mint', '\$3.99', 'assets/cookiemint.jpg',
//                      false, false, context),
//                  _buildCard('Cookie cream', '\$5.99', 'assets/cookiecream.jpg',
//                      true, false, context),
//                  _buildCard('Cookie classic', '\$1.99',
//                      'assets/cookieclassic.jpg', false, true, context),
//                  _buildCard('Cookie choco', '\$2.99', 'assets/cookiechoco.jpg',
//                      false, false, context)
//                ],
//              )
//          ),
//          SizedBox(height: 15.0)
//        ],
//      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      cookieprice:price,
                      cookiename: name
                  )));
            },
            child: Container(
              height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
//                  Padding(
//                      padding: EdgeInsets.all(5.0),
//                      child: Row(
//                          mainAxisAlignment: MainAxisAlignment.end,
//                          children: [
//                            isFavorite ? Icon(Icons.favorite, color: Color(0xFFEF7532)) : Icon(Icons.favorite_border,
//                                color: Color(0xFFEF7532))
//                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 140.0,
                          width: 120.0,
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                fit: BoxFit.fill
                                  )))),
                  SizedBox(width: 8,height: 150,),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,left: 2,right: 2,bottom: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text("bmw brand car new x6 located at ain shams",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Varela',
                                    fontSize: 20.0),textAlign: TextAlign.justify,),
                          SizedBox(width: double.infinity,height: 60,),
                          Row(children: <Widget>[
                            Text("Ain shams",
                                  style: TextStyle(
                                      color: Color(0xFF575E67),
                                      fontFamily: 'Varela',
                                      fontSize: 14.0)),
                            SizedBox(width: 90,height: 10,),

                            Expanded(
                              child: Text("1300000Sar",
                                  style: TextStyle(
                                      color: Color(0xFFCC8053),
                                      fontFamily: 'Varela', fontSize: 14.0)),
                            )
                          ],)
                          ],),),
                  ),
                ]
                )
            )
        )
    );
  }
}