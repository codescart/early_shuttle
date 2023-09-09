import 'package:early_shuttle/Constant/assets.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/color.dart';

class PassHistory extends StatefulWidget {
  const PassHistory({Key? key}) : super(key: key);

  @override
  State<PassHistory> createState() => _PassHistoryState();
}

class _PassHistoryState extends State<PassHistory> {
  List<RouteList> itemList = [
    RouteList('125885','45','1','84','15-08-2023','45, Rameshwar Prasad, V Savarkar Marg, Prabhadevi'),
    RouteList('579954','85','45','80','30-09-2023','Unit 26, Apurva Indl Estate, Makwana Rd, Marol, Andheri (west)'),
    RouteList('297527','78','25','25','25-10-2023','Wz 48, Meer Singh Complex, Jwala Heri, Paschim Vihar'),
    RouteList('792486','12','26','78','02-11-2023','Plot No 1, Ankit Plaza, Neelam Chowk Flyover, N I T, Faridabad'),
    RouteList('026789','83','0','36','14-12-2023','Shop No 5, Plot No 239, Charkop Kesar Chs, Sector 3, Kandivali (west)'),
  ];

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder:(context, index){
          return CustomContainer(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: AlignmentDirectional.topCenter,
              colors: [
                ColorConstant.gradientLightblue,
                ColorConstant.gradientLightGreen,
              ],
            ),
            margin: EdgeInsets.all(15),
            borderRadius: BorderRadius.circular(5),
            // border: Border.all(width: 1,color: Colors.black),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubTitle_Text(
                      Title: itemList[index].CNo,
                    ),
                    SubTitle_Text(
                      Title: "Monthly Pass",
                    ),
                    PrimaryButton(
                      textColor: ColorConstant.whiteColor,
                      fontSize: 13,
                      width: widths/4.5,
                      Label: "Buy Again",
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(Graphics.appIcon, scale: 8,),
                    Small_Text(
                      width: widths/1.8,
                      Title: "Route No- ${itemList[index].route}",
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Small_Text(
                          Title: "Total Rides",
                        ),
                        Small_Text(
                          Title: itemList[index].Nrides,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Small_Text(
                          Title: "Used",
                        ),
                        Small_Text(
                          Title: itemList[index].Used,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Small_Text(
                          Title: "Remaining",
                        ),
                        Small_Text(
                          Title: itemList[index].remain,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Small_Text(
                          Title: "Expiry On",
                        ),
                        Small_Text(
                          Title: itemList[index].exp,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class RouteList {
  final String CNo;
  final String Nrides;
  final String Used;
  final String remain;
  final String exp;
  final String route;

  RouteList(this.CNo, this.Nrides, this.Used, this.remain, this.exp, this.route);
}