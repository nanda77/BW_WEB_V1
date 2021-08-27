import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // SvgPicture.asset("assets/Icons/Angle down.svg", width: 16),
            SizedBox(width: kDefaultPadding / 4),
            SvgPicture.asset("assets/Icons/Markup.svg", width: 20),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              "Projects",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: kGrayColor),
            ),
            Spacer(),
            MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: kGrayColor,
                size: 20,
              ),
            )
          ],
        ),
        SizedBox(height: kDefaultPadding / 2),
        buildTag(context, color: Color(0xFF23CF91), title: "Nveda Villa"),
        buildTag(context, color: Color(0xFF3A6FF7), title: "Amaravati"),
        buildTag(context, color: Color(0xFFF3CF50), title: "Block A"),
        buildTag(context, color: Color(0xFF8338E1), title: "Family Home"),
      ],
    );
  }

  InkWell buildTag(BuildContext context,
      {@required Color color, @required String title}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kDefaultPadding * .3, 10, 0, 10),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/Icons/Markup filled.svg",
              height: 18,
              color: color,
            ),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: kGrayColor),
            ),
          ],
        ),
      ),
    );
  }
}
