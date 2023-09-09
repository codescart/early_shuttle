import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:flutter/material.dart';

import '../../../Constant Widgets/TextStyling/AppBarTitle.dart';
import '../../../Constant Widgets/TextStyling/smallTextStyle.dart';
import '../../../Constant Widgets/TextStyling/titleStyle.dart';

class ExploreRouteList extends StatefulWidget {
  const ExploreRouteList({Key? key}) : super(key: key);

  @override
  State<ExploreRouteList> createState() => _ExploreRouteListState();
}

class _ExploreRouteListState extends State<ExploreRouteList> {
  List<RouteList> itemList = [
    RouteList('45, Rameshwar Prasad, V Savarkar Marg, Prabhadevi',' Unit 26, Apurva Indl Estate, Makwana Rd, Marol, Andheri (west)'),
    RouteList(' Unit 26, Apurva Indl Estate, Makwana Rd, Marol, Andheri (west)','45, Rameshwar Prasad, V Savarkar Marg, Prabhadevi'),
    RouteList(' Wz 48, Meer Singh Complex, Jwala Heri, Paschim Vihar','  Plot No 1, Ankit Plaza, Neelam Chowk Flyover, N I T, Faridabad'),
    RouteList('  Plot No 1, Ankit Plaza, Neelam Chowk Flyover, N I T, Faridabad','Shop No 5, Plot No 239, Charkop Kesar Chs, Sector 3, Kandivali (west)'),
    RouteList('Shop No 5, Plot No 239, Charkop Kesar Chs, Sector 3, Kandivali (west)','45, Rameshwar Prasad, V Savarkar Marg, Prabhadevi'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        leadingWidth: 50,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 20,color: ColorConstant.whiteColor,),),
        title:  HeadingOne(
          Title: "Explore Routes",
          fontSize: 25,
        ),
      ),
      body: CustomContainer(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: itemList.length,
            itemBuilder:(context, index){
              return  CustomContainer(
                gradient: LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
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
                      Title:itemList[index].route1,
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
                      Title:itemList[index].route2,
                    ),
                  ],
                ),
              );
            })

      ),
    );
  }
}

class RouteList {
  final String route1;
  final String route2;

  RouteList(this.route1, this.route2);
}