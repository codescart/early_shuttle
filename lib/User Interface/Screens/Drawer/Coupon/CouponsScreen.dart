import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/Text_Button.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Terms%20&%20Condition/T&C_PopUp.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/My%20Pass/Selected_Pass_Information.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/color.dart';
import '../../../Constant Widgets/Container/Container_widget.dart';
import '../../../Constant Widgets/TextStyling/subtitleStyle.dart';
import '../../../Constant Widgets/TextStyling/titleStyle.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({Key? key}) : super(key: key);

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
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
          Title: "Coupons",
          fontSize: 25,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 15, right: 15, left: 15),
            child: CustomContainer(
              padding: EdgeInsets.all(8),
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
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/male3.png"),
                      ),
                      SizedBox(width: 10,),
                      SubTitle_Text(
                        fontSize: 13,
                        textAlign: TextAlign.justify,
                        width: widths/1.5,
                        Title: "Gift Card Purchase Pass ₹ 1000 Off Valid on pass purchase value greater than ₹ 2000",
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitle_Text(
                        // width: widths/1.2,
                        Title: "Expiries:\n28 April-2023",
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      PrimaryButton(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedPassInformation()));
                        },
                        width: widths/3,
                        Label: "Apply Coupon".toUpperCase(),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text_Button(
                    onTap: (){
                      showDialog(context: context, builder: (BuildContext context)=>TandCPupUp());
                    },
                    textColor:ColorConstant.blueColor,
                    Title: "Terms & Condition Applied",
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
