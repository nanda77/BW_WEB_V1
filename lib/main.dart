import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:buildworks/constants.dart';
import 'package:buildworks/screens/main/main_screen.dart';

import 'landingpage/views/landing_page.dart'; //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

StreamController<int> streamController = StreamController<int>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BuildWorks WebApp',
      theme: ThemeData(),
      // home: MainScreen(),
      home: LandingPage(),
    );
  }
}
