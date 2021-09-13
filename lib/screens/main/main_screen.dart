import 'package:buildworks/components/side_menu_item.dart';
import 'package:buildworks/worksmodule/views/work_titles_view.dart';
import 'package:flutter/material.dart';
import 'package:buildworks/components/side_menu.dart';
import 'package:buildworks/responsive.dart';
import 'package:buildworks/screens/email/email_screen.dart';
import 'components/list_of_emails.dart';
import 'dart:async';
import 'package:get/get.dart';

StreamController<int> streamController = StreamController<int>();

class MainScreen extends StatefulWidget {
  final SideMenu sideMenu;
  // final Stream<int> stream;

  const MainScreen({Key key, this.sideMenu}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = SideMenu().selectedIndex;
  Widget screen = WorkTitlesView();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   widget.stream.listen((_selectedIndex) {
  //     mySetState(_selectedIndex);
  //     print(_selectedIndex);
  //   });
  // }

  final List<Widget> _screens = [
    WorkTitlesView(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  // @override
  // void mySetState(int _selectedIndex) {
  //   setState(() {
  //     screen = _screens[_selectedIndex];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        // Let's work on our mobile part
        mobile: ListOfEmails(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: ListOfEmails(),
            ),
            Expanded(
              flex: 9,
              child: EmailScreen(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              // itemCount: emails.length,
              // On mobile this active dosen't mean anything
              flex: _size.width > 1340 ? 2 : 4,
              child: SideMenu(selectedIndex: _selectedIndex),
            ),

            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: _screens[SideMenuState().selectedIndex],
              // child: _screens[SideMenuState().selectedIndex],
            ),

            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: EmailScreen(),
            ),
          ],
        ),
      ),
    );
  }
}


// class WorkTitleViewState extends SideMenuState {
//   Widget build(BuildContext context) {
//     return ((() {
//       if (SideMenuItem(isActive: btn1) != null) {
//         WorkTitlesView();
//       } else if (SideMenuItem(isActive: btn2) != null) {
//         WorkTitlesView();
//       } else {
//         WorkTitlesView();
//       }
//     })());
//   }
// }

// class SideMenuViews extends StatefulWidget {
//   const SideMenuViews({Key key}) : super(key: key);

//   @override
//   _SideMenuViewsState createState() => _SideMenuViewsState();
// }

// class _SideMenuViewsState extends State<SideMenuViews> {
//   int cindex = 0;
//   @override
//   Widget build(BuildContext context) {
//     print("s");
//     return Scaffold(
//       body: Builder(builder: (context) {
//         if (cindex == 0) {
//           return WorkTitlesView();
//         }
//         if (cindex == 1) {
//           return ListOfEmails();
//         }
//         return Container();
//       }),
//     );
//   }
// }

  // if (SideMenuItem(isActive: btn1) != null) {
              //   flex: _size.width > 1340 ? 3 : 5,
              // WorkTitlesView();
              // } else if () {

              // } else {
              // } {
              //   WorkTitlesView();
              // }else {
              //   WorkTitlesView();
              // },



  