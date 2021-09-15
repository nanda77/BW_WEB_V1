import 'package:flutter/material.dart';
import 'package:buildworks/models/Email.dart';
import 'package:buildworks/responsive.dart';
// import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // We need this back button on mobile only
          if (Responsive.isMobile(context)) BackButton(),
          // IconButton(
          //   icon: SvgPicture.asset(
          //     "assets/Icons/Trash.svg",
          //     width: 24,
          //   ),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: SvgPicture.asset(
          //     "assets/Icons/Reply.svg",
          //     width: 24,
          //   ),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: SvgPicture.asset(
          //     "assets/Icons/Reply all.svg",
          //     width: 24,
          //   ),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: SvgPicture.asset(
          //     "assets/Icons/Transfer.svg",
          //     width: 24,
          //   ),
          //   onPressed: () {},
          // ),
          Text(
            "${emails[0].name}",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          Spacer(),
          // We don't need print option on mobile
          // if (Responsive.isDesktop(context))
          // IconButton(
          //   icon: SvgPicture.asset(
          //     "assets/Icons/Printer.svg",
          //     width: 24,
          //   ),
          //   onPressed: () {},
          // ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/edit_work.svg",
              width: 21,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Icons/dots3.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
