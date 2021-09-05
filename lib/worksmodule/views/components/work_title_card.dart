import 'dart:convert';

import 'package:buildworks/worksmodule/models/work_titles_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:buildworks/models/Email.dart';
// import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buildworks/models/pdfinfoDart.dart';

import '../../../constants.dart';
import '../../../extensions.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProgressBar extends StatelessWidget {
  // const ProgressBar({ Key? key }) : super(key: key);
  // final Email time;
  final int progressValueI;
  final WorksDemo projectProgress;

  const ProgressBar({Key key, this.projectProgress, this.progressValueI})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var progressValue = worksDemo[progressValueI].projectProgress.toInt();

    return Container(
      height: 45,
      width: 45,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: -270,
            endAngle: -271,
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            radiusFactor: 0.8,
            axisLineStyle: AxisLineStyle(
              thickness: 0.3,
              color:
                  const Color.fromARGB(255, 242, 242, 242), //(40, 0, 169, 181)
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  horizontalAlignment: GaugeAlignment.center,
                  positionFactor: 0.18,
                  angle: 90,
                  widget: Text(
                    progressValue.toStringAsFixed(0) + '%',
                    style: TextStyle(fontSize: 11),
                  ))
            ],
            pointers: <GaugePointer>[
              RangePointer(
                  value: progressValue.toDouble(),
                  width: 0.27,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve,
                  gradient: const SweepGradient(colors: <Color>[
                    Color(0xFF9F2FFF),
                    Color(0xFF0BB1D3), // Color(0xFF566FE9),
                  ], stops: <double>[
                    0.10,
                    0.95,
                  ])),
              // MarkerPointer(
              //   value: 70,
              //   markerType: MarkerType.circle,
              //   color: const Color(0xFF87e8e8),
              // )
            ],
          ),
        ],
      ),
    );
  }
}

class WorkTitleCard extends StatelessWidget {
  const WorkTitleCard({
    Key key,
    this.isActive = true,
    this.worksDemox,
    this.press,
    this.pIndex,
  }) : super(key: key);

  final bool isActive;
  final WorksDemo worksDemox;
  final int pIndex;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x1A000000), width: 1),
                color: isActive
                    ? Color(0xFF88A1AC).withOpacity(0.47)
                    : kBgCardColor,
                // borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          ProgressBar(progressValueI: pIndex),
                          // SizedBox(
                          //   width: 32,
                          //   child: CircleAvatar(
                          //     backgroundColor: Colors.transparent,
                          //     backgroundImage: AssetImage(email.image),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${worksDemox.name} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive ? kTextColor : kTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: worksDemox.startDatePlan,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      color: isActive
                                          ? kTextSubColor
                                          : kTextSubColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset("assets/Icons/Angle right.svg",
                              width: 18,
                              color: Color(0xFF88A1AC).withOpacity(1)),
                          // Text(
                          //   email.time,
                          //   style: Theme.of(context).textTheme.caption.copyWith(
                          //         color: isActive ? Colors.white70 : null,
                          //       ),
                          // ),
                          // SizedBox(height: 5),
                          // if (email.isAttachmentAvailable)
                          //   SvgPicture.asset(
                          //     "assets/Icons/Paperclip.svg",
                          //     color: isActive ? Colors.white70 : kGrayColor,
                          //   )
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(height: kDefaultPadding / 2),
                  // Text(
                  //   email.body,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: Theme.of(context).textTheme.caption.copyWith(
                  //         height: 1.5,
                  //         color: isActive ? Colors.white70 : null,
                  //       ),
                  // )
                ],
              ),
            ),
            // .addNeumorphism(
            //   blurRadius: 15,
            //   borderRadius: 15,
            //   offset: Offset(5, 5),
            //   topShadowColor: Colors.white60,
            //   bottomShadowColor: Color(0xFF234395).withOpacity(0.05),
            // ),
            // if (!email.isChecked)
            //   Positioned(
            //     right: 8,
            //     top: 8,
            //     child: Container(
            //       height: 12,
            //       width: 12,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: kBadgeColor,
            //       ),
            //     ).addNeumorphism(
            //       blurRadius: 4,
            //       borderRadius: 8,
            //       offset: Offset(2, 2),
            //     ),
            //   ),
            // if (email.tagColor != null)
            //   Positioned(
            //     left: 8,
            //     top: 0,
            //     child: SvgPicture.asset(
            //       "assets/Icons/Markup filled.svg",
            //       height: 18,
            //       color: email.tagColor,
            //     ),
            //   )
          ],
        ),
      ),
    );
  }
}
