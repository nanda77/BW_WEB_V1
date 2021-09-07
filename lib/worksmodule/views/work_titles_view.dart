import 'package:buildworks/worksmodule/controllers/work_titles_controller.dart';
import 'package:buildworks/worksmodule/models/work_titles_model.dart';
import 'package:flutter/material.dart';
import 'package:buildworks/components/side_menu.dart';
import 'package:buildworks/models/Email.dart';
import 'package:buildworks/responsive.dart';
import 'package:buildworks/screens/email/email_screen.dart';
// import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buildworks/screens/main/components/email_card.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
// import 'email_card.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'components/work_title_card.dart';

class WorkTitlesView extends StatefulWidget {
  // Press "Command + ."
  const WorkTitlesView({
    Key key,
  }) : super(key: key);

  @override
  _WorkTitlesViewState createState() => _WorkTitlesViewState();
}

class _WorkTitlesViewState extends State<WorkTitlesView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final WorkTitlesController workTitlesController =
      Get.put(WorkTitlesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgWorksColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              // This is our Search bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    // Once user click the menu icon the menu shows like drawer
                    // Also we want to hide this menu icon on desktop
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                    if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(
                                kDefaultPadding * 0.75), //15
                            child: SvgPicture.asset(
                              "assets/Icons/Search.svg",
                              width: 24,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/Icons/Angle down.svg",
                      width: 16,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Slab",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: SvgPicture.asset(
                        "assets/Icons/plus_square.svg",
                        color: Color(0xFF282F3F), //0xFF8E63E6
                        width: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                  child: ListView.builder(
                // itemCount: emails.length,
                itemCount: worksDemo.length,
                // On mobile this active dosen't mean anything
                itemBuilder: (context, index) => WorkTitleCard(
                  pIndex: index,
                  isActive: Responsive.isMobile(context) ? false : index == 0,
                  // email: emails[index],
                  worksDemox: worksDemo[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailScreen(email: emails[index]),
                      ),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
