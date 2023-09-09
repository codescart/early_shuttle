import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/Text_Button.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Refer&Earn/How_it_works.dart';
import 'package:flutter/material.dart';

class ReferEarn extends StatefulWidget {
  const ReferEarn({Key? key}) : super(key: key);

  @override
  State<ReferEarn> createState() => _ReferEarnState();
}

class _ReferEarnState extends State<ReferEarn> {
  double _progressValue = 0.5;
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
          Title: "Refer & Earn",
          fontSize: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
              // padding: EdgeInsets.all(10),
              borderRadius:BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0,3),
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 2,
                      spreadRadius: 1
                  )
                ],
              child: Column(
                children: [
                  ListTile(
                    title: TitleStyle(
                      alignment: Alignment.centerLeft,
                      textColor: ColorConstant.darkBlackColor,
                      Title: "Ashutosh Tripathi",
                    ),
                    subtitle:SubTitle_Text(
                      alignment: Alignment.centerLeft,
                      textColor: ColorConstant.blueColor,
                      fontWeight: FontWeight.w600,
                      Title: "Level 1",
                    ),
                    trailing:Icon(Icons.arrow_forward_ios_outlined, size: 20,color: ColorConstant.darkBlackColor,)
                  ),
                  Divider(),
                  SubTitle_Text(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    Title: 'Earned from referrals',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Small_Text(
                          fontWeight: FontWeight.w600,
                          Title: "₹ 124 ",
                        ),
                        Small_Text(
                          Title: "₹ 254745\nPotential Earning",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: widths/1.3,
                    child: LinearProgressIndicator(
                      value: _progressValue, // Set the progress value between 0.0 and 1.0
                      minHeight: 15, // Set the minimum height of the progress indicator
                      backgroundColor: Colors.grey, // Set the background color of the progress bar
                      valueColor: AlwaysStoppedAnimation<Color>(ColorConstant.primaryColor), // Set the progress bar color
                    ),
                  ),
                  SizedBox(height: 20),
                  Small_Text(
                    padding: EdgeInsets.only(left: 10),
                    textColor: ColorConstant.blueColor,
                    Title: "Referred 1 Person",
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
            SizedBox(height: 15,),
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
              // padding: EdgeInsets.all(10),
              borderRadius:BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 2,
                    spreadRadius: 1
                )
              ],
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  TitleStyle(
                    textAlign: TextAlign.center,
                    textColor: ColorConstant.darkBlackColor,
                    Title: "Refer and get 50 points and \nextra 2% commision on every ride",
                  ),
                  Image.asset("assets/community.png"),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.copy, size: 20,),
                      SubTitle_Text(
                        textAlign: TextAlign.center,
                        Title: "IMZJ69  Copy referral code",
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  PrimaryButton(
                    width: widths/1.2,
                    Label: "Refer Now",
                    textColor: ColorConstant.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitle_Text(
                        textColor: ColorConstant.blueColor,
                        padding: EdgeInsets.only(left: 15),
                        Title: "Share",
                      ),
                      Text_Button(
                        padding: EdgeInsets.only(right: 15),
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context)=>HowItWorks()
                          );
                        },
                        Title: "How it works",
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
