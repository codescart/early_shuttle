import 'package:early_shuttle/Constant/assets.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/My%20Pass/Selected_Pass_Information.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/color.dart';

class BuyPass extends StatefulWidget {
  const BuyPass({Key? key}) : super(key: key);

  @override
  State<BuyPass> createState() => _BuyPassState();
}

class _BuyPassState extends State<BuyPass> {
  List<RouteList> itemList = [
    RouteList('45, Rameshwar Prasad, V Savarkar Marg, Prabhadevi',' Unit 26, Apurva Indl Estate, Makwana Rd, Marol, Andheri (west)'),
    RouteList(' Unit 26, Apurva Indl Estate, Makwana Rd, Marol, Andheri (west)','45, Rameshwar Prasad, V Savarkar Marg, Prabhadevi'),
    RouteList(' Wz 48, Meer Singh Complex, Jwala Heri, Paschim Vihar','  Plot No 1, Ankit Plaza, Neelam Chowk Flyover, N I T, Faridabad'),
    RouteList('  Plot No 1, Ankit Plaza, Neelam Chowk Flyover, N I T, Faridabad','Shop No 5, Plot No 239, Charkop Kesar Chs, Sector 3, Kandivali (west)'),
    RouteList('Shop No 5, Plot No 239, Charkop Kesar Chs, Sector 3, Kandivali (west)','45, Rameshwar Prasad, V Savarkar Marg, Prabhadevi'),
  ];

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
          alignment: Alignment.centerLeft,
          Title: "Select Pass",
          fontSize: 25,
        ),
      ),
      body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder:(context, index){
            return CustomContainer(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedPassInformation(
                  route1: itemList[index].route1,
                  route2:itemList[index].route2
                )));
              },
              color: ColorConstant.whiteColor,
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
                 Small_Text(
                   Title:"Route 1-  "+ itemList[index].route1,
                 ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Small_Text(
                    Title:"Route 2-  "+ itemList[index].route2,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class RouteList {
  final String route1;
  final String route2;

  RouteList(this.route1, this.route2);
}