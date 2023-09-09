import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:flutter/material.dart';

class SafetyZone extends StatefulWidget {
  const SafetyZone({Key? key}) : super(key: key);

  @override
  State<SafetyZone> createState() => _SafetyZoneState();
}

class _SafetyZoneState extends State<SafetyZone> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        leadingWidth: 50,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 20,color: ColorConstant.whiteColor,),),
        title:  HeadingOne(
          Title: "Safety Zone",
          fontSize: 25,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            HeadingOne(
              // fontWeight: FontWeight.w600,
              fontSize: 25,
              textColor: ColorConstant.darkBlackColor,
              Title: "Promise to keep you safe",
            ),
            SizedBox(height: 10,),
            TitleStyle(
              textColor: ColorConstant.darkBlackColor,
              Title: "These safety features ensure that your ride always stay worry-free",
            ),
            SizedBox(height: 20,),
            CustomContainer(
              padding: EdgeInsets.all(5),
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstant.gradientLightGreen,
                  ColorConstant.gradientLightblue
                ],
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 2,
                    spreadRadius: 1
                )
              ],
              child:  Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, color: ColorConstant.blueColor,size: 30,),
                      SizedBox(width: 10,),
                      TitleStyle(
                        textColor: ColorConstant.darkBlackColor,
                        padding: EdgeInsets.only(bottom: 3),
                        alignment: Alignment.centerLeft,
                        Title: "Emergency Contacts",
                      ),
                    ],
                  ),
                  SubTitle_Text(
                    width: widths/1.2,
                    Title: "Alert your family member or close friend in case of an emergency.",
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  PrimaryButton(
                    color: ColorConstant.greyColor,
                    width: widths/3,
                    Label: "not enabled".toUpperCase(),
                  ),
                ],
              ),
              // ListTile(
              //   contentPadding: EdgeInsets.all(5),
              //   leading: Icon(Icons.person, color: ColorConstant.blueColor,),
              //   title: SubTitle_Text(
              //     padding: EdgeInsets.only(bottom: 3),
              //     alignment: Alignment.centerLeft,
              //     Title: "Emergency Contacts",
              //   ),
              //   subtitle: Column(
              //     mainAxisSize:MainAxisSize.min,
              //     children: [
              //       Small_Text(
              //         Title: "Alert your family member or close friend in case of an emergency.",
              //         padding: EdgeInsets.only(bottom: 10),
              //       ),
              //       PrimaryButton(
              //         color: ColorConstant.greyColor,
              //         width: widths/3,
              //         Label: "not enabled".toUpperCase(),
              //       ),
              //     ],
              //   ),
              // ),
            ),
            SizedBox(height: 20,),
            CustomContainer(
              padding: EdgeInsets.all(5),
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstant.gradientLightGreen,
                  ColorConstant.gradientLightblue
                ],
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 2,
                    spreadRadius: 1
                )
              ],
              child:  Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: ColorConstant.blueColor,size: 30,),
                      SizedBox(width: 10,),
                      TitleStyle(
                        textColor: ColorConstant.darkBlackColor,
                        padding: EdgeInsets.only(bottom: 3),
                        alignment: Alignment.centerLeft,
                        Title: "Share Ride Details",
                      ),
                    ],
                  ),
                  SubTitle_Text(
                    width: widths/1.2,
                    Title: "Alert your family member or close friend in case of an emergency.",
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  PrimaryButton(
                    color: ColorConstant.greyColor,
                    width: widths/3,
                    Label: "not enabled".toUpperCase(),
                  ),
                ],
              ),
              // ListTile(
              //   contentPadding: EdgeInsets.all(5),
              //   leading: Icon(Icons.person, color: ColorConstant.blueColor,),
              //   title: SubTitle_Text(
              //     padding: EdgeInsets.only(bottom: 3),
              //     alignment: Alignment.centerLeft,
              //     Title: "Emergency Contacts",
              //   ),
              //   subtitle: Column(
              //     mainAxisSize:MainAxisSize.min,
              //     children: [
              //       Small_Text(
              //         Title: "Alert your family member or close friend in case of an emergency.",
              //         padding: EdgeInsets.only(bottom: 10),
              //       ),
              //       PrimaryButton(
              //         color: ColorConstant.greyColor,
              //         width: widths/3,
              //         Label: "not enabled".toUpperCase(),
              //       ),
              //     ],
              //   ),
              // ),
            ),
            SizedBox(height: 20,),
            CustomContainer(

              padding: EdgeInsets.all(5),
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstant.gradientLightGreen,
                  ColorConstant.gradientLightblue
                ],
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 2,
                    spreadRadius: 1
                )
              ],
              child:  Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_city_rounded, color: ColorConstant.blueColor,size: 30,),
                      SizedBox(width: 10,),
                      TitleStyle(
                        textColor: ColorConstant.darkBlackColor,
                        padding: EdgeInsets.only(bottom: 3),
                        alignment: Alignment.centerLeft,
                        Title: "Home Check",
                      ),
                    ],
                  ),
                  SubTitle_Text(
                    width: widths/1.2,
                    Title: "Alert your family member or close friend in case of an emergency.",
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  PrimaryButton(
                    color: ColorConstant.greyColor,
                    width: widths/3,
                    Label: "not enabled".toUpperCase(),
                  ),
                ],
              ),
              // ListTile(
              //   contentPadding: EdgeInsets.all(5),
              //   leading: Icon(Icons.person, color: ColorConstant.blueColor,),
              //   title: SubTitle_Text(
              //     padding: EdgeInsets.only(bottom: 3),
              //     alignment: Alignment.centerLeft,
              //     Title: "Emergency Contacts",
              //   ),
              //   subtitle: Column(
              //     mainAxisSize:MainAxisSize.min,
              //     children: [
              //       Small_Text(
              //         Title: "Alert your family member or close friend in case of an emergency.",
              //         padding: EdgeInsets.only(bottom: 10),
              //       ),
              //       PrimaryButton(
              //         color: ColorConstant.greyColor,
              //         width: widths/3,
              //         Label: "not enabled".toUpperCase(),
              //       ),
              //     ],
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
