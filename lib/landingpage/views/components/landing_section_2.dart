import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class LandingSection2 extends StatefulWidget {
  @override
  _LandingSection2State createState() => _LandingSection2State();
}

class _LandingSection2State extends State<LandingSection2> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;
  List imgList = [
    'assets/images/add_project.gif', //project_creation
    'assets/images/add_work.gif', //add_work_title
    'assets/images/quick_update.gif', //add_update //normal_update //quick_update
    'assets/images/reports_signed.gif', //
    'assets/images/add_material.gif', //material
    'assets/images/add_usage.gif', //material_wt
    'assets/images/360_add.gif', //360
    'assets/images/attendance.gif',
    'assets/images/location.gif'
  ];
  List<String> stringList1 = [
    'Step 1', //
    'Step 2',
    'Step 3',
    'Step 4',
    'Step 5',
    'Step 6',
    'Step 7',
    'Step 8',
    'Step 9'
  ];
  List<String> stringList2 = [
    'How to create a project?', //
    'How to add works under a project?',
    'Adding daily updates under a work?',
    'Downloading signed pdf work reports?',
    'How to add materials under a project?',
    'Linking material usage to a work?',
    'Adding a 360° image of the site?',
    'Maintaining staff attendance?',
    "Tracking staff's location on site?"
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 720, minHeight: 500),
      margin: EdgeInsets.only(left: 100, right: 100, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "${stringList1[_current]}",
                    style: GoogleFonts.montserrat(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF282F3F)),
                  ),
                ),
                Container(
                  child: Text(
                    "${stringList2[_current]}",
                    style: GoogleFonts.montserrat(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF282F3F)),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: 7.0,
                      height: 7.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Colors.deepPurple
                            : Colors.black38,
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: goToPrevious,
                      child: Text(
                        "<",
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 27),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    OutlinedButton(
                      onPressed: goToNext,
                      child: Text(
                        ">",
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 27),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 500,
                height: 720,
                child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      height: 720,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 60),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      reverse: false,
                      pauseAutoPlayOnTouch: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: imgList.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                imgUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  goToPrevious() {
    buttonCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
