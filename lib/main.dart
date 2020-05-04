import 'package:flutter/material.dart';
import './MainScreen.dart';
import 'package:glugpace/eventpage.dart';

void main() {

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/event': (context) => EventPage(),
      },
    )
  );

}