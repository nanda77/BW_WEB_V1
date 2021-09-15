import 'dart:ui';

import 'package:buildworks/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(left: 80, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset("assets/images/ic_logo_4x.png",
                  width: 74, height: 67),
              SizedBox(
                width: 20,
              ),
              SvgPicture.asset("assets/Icons/bw_text.svg", width: 150),
              // Text(
              //   "Buildworks",
              //   style: GoogleFonts.montserrat(
              //       fontSize: 28, fontWeight: FontWeight.bold),
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     SizedBox(
                    //       height: 12,
                    //     ),
                    // Text(
                    //   'Pricing',
                    //   style: GoogleFonts.roboto(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    //     ),
                    //     SizedBox(height: 5),
                    //   ],
                    // ),
                    SizedBox(width: screenSize.width / 20),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        // Text(
                        //   'Log In',
                        //   style: GoogleFonts.roboto(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),

                        TextButton.icon(
                          icon: Image.asset("assets/images/login.png",
                              height: 67),
                          label: Text(""),
                          onPressed: StoreUrls().playStoreURL,
                        ),
                        // SizedBox(height: 5),
                      ],
                    ),
                    SizedBox(width: screenSize.width / 20),
                  ],
                ),
              ),
              // SizedBox(width: screenSize.width / 40),
            ],
          ),
        ),
      ),
    );
  }
}
