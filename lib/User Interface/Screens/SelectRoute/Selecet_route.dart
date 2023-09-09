import 'package:early_shuttle/Constant/assets.dart';
import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Reserve%20Seat/Select_Time_Slot.dart';
import 'package:flutter/material.dart';

class Select_route extends StatefulWidget {
  const Select_route({Key? key}) : super(key: key);

  @override
  State<Select_route> createState() => _Select_routeState();
}

class _Select_routeState extends State<Select_route> {

  List<RouteList> itemList = [
    RouteList('304 Chandan Chambers, 138, Modi Street','103, 3, Ansal Chamber 1, Bhikaji Cama Place', '503-a, Mayur Apartment, Sodawala Cross Lane,', '0.5 Km','20 Km' ),
    RouteList(' 40 Sector 27a','P O Box 20 Standard House, 83 Maharshi Karve', '48, Bdd Chawl, Jambholi Maidan, Worli', '1.0 Km', '50 Km'),
    RouteList('1-8-32/42/a, Minister Road','Marwah Centre, Krishnanlal Marwah Marg, Nr', ' Shyam Wadi, Ranade Rd, Near Anand Cut-piece', '0.2 Km', '100 Km'),
    RouteList('F-128/3, Behind Bhikaji Cama Place,','103, 3, Ansal Chamber 1, Bhikaji Cama Place', '503-a, Mayur Apartment, Sodawala Cross Lane,', '0.5 Km','20 Km' ),
    RouteList('50 M, Gate No 4, Shanti Path','P O Box 20 Standard House, 83 Maharshi Karve', '48, Bdd Chawl, Jambholi Maidan, Worli', '1.0 Km', '50 Km'),
    RouteList('','Marwah Centre, Krishnanlal Marwah Marg, Nr', ' Shyam Wadi, Ranade Rd, Near Anand Cut-piece', '0.2 Km', '100 Km'),
  ];

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstant.primaryColor,
        titleSpacing: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 18,color: ColorConstant.whiteColor,),),
        centerTitle: true,
        title:HeadingOne(
          Title: "Select The Route",
        ) ,
      ),
      body: Container(
        height: heights,
        decoration: BoxDecoration(

        ),
        padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
        child: ListView.builder(
          itemCount: 5,
            itemBuilder: (BuildContext, index){
          return  CustomContainer(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectTimeSlot(navigateStatus: '1',)));
            },
            border: Border.all(
                width: 0.8, color: ColorConstant.greyColor.withOpacity(0.2)
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: AlignmentDirectional.topCenter,
              colors: [
                ColorConstant.gradientLightGreen,
                ColorConstant.gradientLightblue
              ],
            ),
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            // height: heights/5,
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
            spreadRadius: 0,
            shadowColor:ColorConstant.greyColor.withOpacity(0.2),
            blurRadius: 2,
            blurStyle: BlurStyle.inner,
            child: Column(
              children: [
                CustomContainer(
                  padding: EdgeInsets.only(left: 3, top: 3, bottom: 3),
                  alignment: Alignment.center,
                  // height: 25,
                  width:widths/1.2,
                  color: ColorConstant.whiteColor.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                  ),
                child: Small_Text(
                  fontSize: 11,
                  // overflow: TextOverflow.ellipsis,
                  Title:"Route No- "+itemList[index].route.toString()
                  // "Route No- 30 Dwarka Mor -Sector 62 Golf Course Road",
                ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(Graphics.orangeRound, scale: 18,),
                        SizedBox(height: 10,),
                        // Image.asset(Graphics.routes, scale: 8,),
                        Image.asset(Graphics.mapIcon, scale: 8,),
                        SizedBox(height: 10,),
                        Image.asset(Graphics.bluePin, scale: 18,),
                      ]
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(height: 10,),
                            Small_Text(
                              width: widths/1.8,
                              Title: itemList[index].from
                              // "Mangum Tower Sector 58 (Splendor Spectrum One)",
                            ),
                            CustomContainer(
                              width: widths/5 ,
                              child: Column(
                                children: [
                                  Small_Text(
                                    // width: wid,
                                    Title: "Distance",
                                  ),
                                  Small_Text(
                                    textColor: ColorConstant.blueColor,
                                    Title: itemList[index].fromDist
                                    // "25 Km",
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8,bottom: 8),
                          height: 1,
                          width: widths/1.3,
                          color: ColorConstant.greyColor.withOpacity(0.4),
                        ),
                        // Divider(thickness: 3, color: ColorConstant.greyColor.withOpacity(1),),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Small_Text(
                              width: widths/1.8,
                              Title: itemList[index].to
                              // "Sector-4/5 Crossing Bus Stand, Dwarka",
                            ),
                            CustomContainer(
                              padding: EdgeInsets.all(0),
                              width: widths/5,
                              child: Column(
                                children: [
                                  Small_Text(
                                    // width: widths,
                                    Title: "Distance",
                                  ),
                                  Small_Text(
                                    textColor: ColorConstant.blueColor,
                                    Title: itemList[index].toDist
                                    // "0.36 Km",
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class RouteList {
  final String route;
  final String from;
  final String to;
  final String fromDist;
  final String toDist;

  RouteList(this.route, this.from, this.to, this.fromDist, this.toDist);
}
