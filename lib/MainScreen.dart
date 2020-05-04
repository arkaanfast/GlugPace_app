import 'dart:ui';
import 'package:glugpace/aboutContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glugpace/models/aboutModel.dart';
import 'package:glugpace/myDrawer.dart';
import 'dart:async';


class MainScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainScreen();
  }
}
class _MainScreen extends State<MainScreen> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  final double maxSlide = 225.0;
  PageController _pageController = PageController( initialPage: 0);
  int _currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250)
    );
    Timer.periodic(Duration(seconds: 5), (Timer time) {
      if (_currentPage < 1) {
        _currentPage ++;
      }
      else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.decelerate);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    var aboutPage = Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,

        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: toggle,
          color: Colors.black,
          ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFFBDEE8FF)
//            gradient: LinearGradient(
//                colors: [Color(0xFFB667eea), Color(0xFFBFF6FFF)]
//            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFBDEE8FF)
//                    gradient: LinearGradient(
//                        colors: [Color(0xFFB667eea), Color(0xFFBFF6FFF)]
//                    )
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, bottom: 30.0),
                      child: Image.asset('assets/images/logo.png', scale: 1.7),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 30.0),
                      child: Text("GLUG PACE", style: TextStyle(fontSize: 35.0, fontFamily: 'RobotoMono',), ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.54,
              width: MediaQuery.of(context).size.width * 0.95,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
//                onPageChanged: _onPageChange,
                controller: _pageController,
                itemCount: sliderContent.length,
                itemBuilder: (context, i) {
                  return AboutContent(i);
                },
              ),
            ),
          ],
        ),
      )
    );

    return Scaffold(
        body: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              double slide = maxSlide * animationController.value;
              double scale = 1 - (animationController.value * 0.3);
              return  Stack(
                children: <Widget>[
                  MyDrawer(isHome: true,),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: aboutPage,
                  )
                ],
              );
            },
          ),
        );
  }


  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var firstContactPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var secondContactPoint = Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height-30);
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(firstContactPoint.dx, firstContactPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondContactPoint.dx, secondContactPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return oldClipper != this;
  }

}
