import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glugpace/myDrawer.dart';
import 'package:glugpace/models/eventModel.dart';


class EventPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _EventPage();
  }

}

class _EventPage extends State<EventPage> with SingleTickerProviderStateMixin {

  final double maxSlide = 225.0;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250)
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var eventPage =  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Events", style: TextStyle(fontFamily: "Ubuntu", color: Colors.black87),),
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: toggle,
          color: Colors.black,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Color(0xFFBDEE8FF)
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            color: Colors.black87,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              elevation: 8.0,
              shadowColor: Colors.deepPurpleAccent,
              semanticContainer: true,
              child: Stack(
                children: <Widget>[
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
                    child: Image.network(events[index].image)
                  ),
                  Positioned(
                    bottom:6,
                    left: 16,
                    child: Text(events[index].time, style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  )
                ],
              ),
            ),
          );
        },
      )
    );

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          double slide = maxSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return  Stack(
            children: <Widget>[
              MyDrawer(isHome: false),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: eventPage,
              )
            ],
          );
        },
      ),
    );



  }


  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

}