import 'package:flutter/material.dart';
import 'package:glugpace/models/aboutModel.dart';

class AboutContent extends StatelessWidget {

  final int index;
  AboutContent(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: Colors.deepPurpleAccent
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFBF5F6F8),
            blurRadius: 0.0, // has the effect of softening the shadow
            spreadRadius: 15.0, // has the effect of extending the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              0.0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 16.0,),
          Image.asset(sliderContent[index].image, height: MediaQuery.of(context).size.height * 0.2,),
          SizedBox(height: 12.0,),
          Text(sliderContent[index].title, style: TextStyle(fontSize: 28.0, fontFamily: 'RobotMono',)),
          SizedBox(height: 10.0,),
          Text(sliderContent[index].description,
            style: TextStyle(fontFamily: 'Jost', fontSize: 18.0),
            textAlign: TextAlign.center,)
        ],
      ),
    );

  }



}