import 'package:flutter/material.dart';
import 'package:outlook/responsive.dart';
// import 'package:websafe_svg/websafe_svg.dart'; SvgPicture
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../extensions.dart';
import 'side_menu_item.dart';
import 'tags.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool btn1 = true;
  bool btn2 = false;
  bool btn3 = false;
  bool btn4 = false;
  var currentState = "";
  moveReports(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle1 = TextButton.styleFrom(
      minimumSize: Size(
        double.infinity,
        double.minPositive,
      ),
      backgroundColor: Color(0xFF8E63E6),
      // backgroundColor: Colors.grey,
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
    // final ButtonStyle flatButtonStyle2 = TextButton.styleFrom(
    //   minimumSize: Size(
    //     double.infinity,
    //     double.minPositive,
    //   ),
    //   backgroundColor: Color(0xFFEBEDFA),
    //   padding: EdgeInsets.symmetric(
    //     vertical: kDefaultPadding,
    //   ),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
          color: kBgSideMenuColor,
          border: Border.all(color: Color(0x1A000000), width: 1)
          // borderRadius: BorderRadius.circular(15),
          ),
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),

      // color: kBgSideMenuColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/ic_logo.png",
                    width: 47,
                    height: 47,
                  ),
                  Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              TextButton.icon(
                // color: Colors.kPrimaryColor,
                style: flatButtonStyle1,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/Icons/Plus1.svg",
                  width: 16,
                  height: 16,
                ),
                label: Text(
                  "Add Update",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: Color(0xFF8E63E6).withOpacity(0.2),
              ),
              SizedBox(height: kDefaultPadding * 4),
              Container(
                alignment: Alignment.centerLeft,
                // style: flatButtonStyle2,
                // color: Color.kBgDarkColor,
                // onPressed: () {},
                // icon: SvgPicture.asset("assets/Icons/Download.svg", width: 16),
                child: Text(
                  " Nveda Villa",
                  style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 22),
                ),
              ),
              // .addNeumorphism(),
              SizedBox(height: kDefaultPadding * 0.5),
              // Menu Items
              SideMenuItem(
                press: () {
                  setState(() {
                    btn1 = true;
                    btn2 = false;
                    btn3 = false;
                    btn4 = false;
                  });
                },
                title: "Works",
                iconSrc: "assets/Icons/Works.svg",
                isActive: btn1,
                // itemCount: 3,
              ),
              SideMenuItem(
                press: () {
                  setState(() {
                    btn1 = false;
                    btn2 = true;
                    btn3 = false;
                    btn4 = false;
                  });
                },
                title: "Reports",
                iconSrc: "assets/Icons/Reports.svg",
                isActive: btn2,
                // itemCount: 3,
              ),
              SideMenuItem(
                press: () {
                  setState(() {
                    btn1 = false;
                    btn2 = false;
                    btn3 = true;
                    btn4 = false;
                  });
                },
                title: "Material",
                iconSrc: "assets/Icons/Material.svg",
                isActive: btn3,
              ),
              SideMenuItem(
                press: () {
                  setState(() {
                    btn1 = false;
                    btn2 = false;
                    btn3 = false;
                    btn4 = true;
                  });
                },
                title: "Staff",
                iconSrc: "assets/Icons/Members.svg",
                isActive: btn4,
                showBorder: false,
              ),

              SizedBox(height: kDefaultPadding * 4),
              // Tags
              Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
