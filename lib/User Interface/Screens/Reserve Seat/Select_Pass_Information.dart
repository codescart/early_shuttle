import 'package:early_shuttle/Constant/assets.dart';
import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:flutter/material.dart';

import '../../Constant Widgets/TextStyling/smallTextStyle.dart';

class SelectPassInfo extends StatefulWidget {
  const SelectPassInfo({Key? key}) : super(key: key);

  @override
  State<SelectPassInfo> createState() => _SelectPassInfoState();
}

class _SelectPassInfoState extends State<SelectPassInfo> {
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
          Title: "Select Pass Information",
          fontSize: 25,
        ),
      ),
      body: CustomContainer(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CustomContainer(
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
              margin: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(width: 1,color: Colors.black),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TitleStyle(
                    // padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    fontWeight: FontWeight.w600,
                    textColor: ColorConstant.darkBlackColor,
                    Title: "Route 1:",
                  ),
                  SubTitle_Text(
                    Title:"45, Rameshwar Prasad, V Savarkar Marg, Prabhadevi",
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  TitleStyle(
                    // padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    fontWeight: FontWeight.w600,
                    textColor: ColorConstant.darkBlackColor,
                    Title: "Route 2:",
                  ),
                  SubTitle_Text(
                    Title:"Unit 26, Apurva Indl Estate, Makwana Rd, Marol, Andheri (west)",
                  ),
                ],
              ),
            ),
            CustomContainer(
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
              margin: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(width: 1,color: Colors.black),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TitleStyle(
                    fontWeight: FontWeight.w600,
                    alignment: Alignment.centerLeft,
                    textColor: ColorConstant.darkBlackColor,
                    Title:"Pass: ",
                  ),
                  SubTitle_Text(
                    Title: "Monthly 15 Rides One Side (Valid for 30 calender days)",
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitle_Text(
                        fontWeight: FontWeight.w600,
                        Title:"Total Amount: ",
                      ),
                      SubTitle_Text(
                        Title:"₹ 10598",
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitle_Text(
                        fontWeight: FontWeight.w600,
                        Title:"Amount Payable:",
                      ),
                      SubTitle_Text(
                        Title:"₹ 10598",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomContainer(
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
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              borderRadius: BorderRadius.circular(5),
              child: Column(
                children: [
                  TitleStyle(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    fontWeight: FontWeight.w600,
                    textColor: ColorConstant.darkBlackColor,
                    Title: "Pay With: ",
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Image.asset(Graphics.paytm),
                    title: HeadingOne(
                      textColor: Colors.black,
                      alignment: Alignment.centerLeft,
                      Title: "Paytm",
                    ),
                    trailing: SubTitle_Text(
                      padding: EdgeInsets.only(right: 10),
                      alignment: FractionalOffset.centerRight,
                      width:widths/3 ,
                      Title:"₹ 10598",
                    ) ,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
