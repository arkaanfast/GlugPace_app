import 'package:flutter/cupertino.dart';

class EventModel {
  String image;
  String time;
  EventModel({ @required this.image, @required this.time});
}

List<EventModel> events = [
  EventModel(image: 'https://raw.githubusercontent.com/glugpace/GLUG-PACE/master/events/tech-treasure-hunt-2/images/TTH.jpeg', time: "26-04-2020"),
  EventModel(image: 'https://raw.githubusercontent.com/glugpace/GLUG-PACE/master/events/free-software-talk/images/ram.png', time: "05-04-2020"),
  EventModel(image: 'https://raw.githubusercontent.com/glugpace/GLUG-PACE/master/events/technologia-raza/images/tmain.png', time: "29-03-2020"),
];