import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {

  final bool isHome;
  MyDrawer({this.isHome});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFFBFBFBFB)
//        gradient: LinearGradient(
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter,
//            colors: [Color(0xFFB667eea), Color(0xFFBFF6FFF)]
//        )
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height) / 12 ),
//        padding: EdgeInsets.only(left: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 18.0, bottom: 25.0),
                width: MediaQuery.of(context).size.width / 1.9,
                child: Text("GNU/LINUX USERS GROUP", style: TextStyle(fontSize: 30.0, fontFamily: "Ubuntu", fontWeight: FontWeight.w700, color: Color(0xFFB003D50))),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  width: MediaQuery.of(context).size.width / 2,
                  child:Row(
                    children: <Widget>[
                      Icon(Icons.description, color: Color(0xFFBFF785B),),
                      FlatButton(
                        child: Text("Events", style: TextStyle(fontSize: 20.0, color: Colors.black87),),
                        onPressed: () {
                          Navigator.pushNamed(context, '/event');
                        },
                      )
                    ],
                  )
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  width: MediaQuery.of(context).size.width / 2,
                  child:Row(
                    children: <Widget>[
                      Icon(Icons.account_box, color: Color(0xFFBFF785B)),
                      FlatButton(
                        child: Text("Team", style: TextStyle(fontSize: 20.0),),
                        onPressed: () {
                          return null;
                        },
                      )
                    ],
                  )
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  width: MediaQuery.of(context).size.width / 2,
                  child:Row(
                    children: <Widget>[
                      Icon(Icons.announcement, color: Color(0xFFBFF785B)),
                      FlatButton(
                        child: Text("CoC", style: TextStyle(fontSize: 20.0),),
                        onPressed: () {
                          return null;
                        },
                      )
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }

}