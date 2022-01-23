import 'dart:async';

import 'package:buildworks/responsive.dart';
import 'package:flutter/material.dart';
// import 'package:buildworks/constants.dart';
import 'package:buildworks/screens/main/main_screen.dart';

import 'landingpage/views/landing_page.dart';
import 'landingpage/views/smalllanding_page.dart'; //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

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
      title: 'BuildWorks',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      // home: MainScreen(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: LandingPage(),
      tablet: SmallLandingPage(),
      mobile: SmallLandingPage(),
    );
  }
}


// Responsive(
//       desktop: LandingPage(),
//       tablet: LandingPage(),
//       mobile: SmallLandingPage(),
//     );