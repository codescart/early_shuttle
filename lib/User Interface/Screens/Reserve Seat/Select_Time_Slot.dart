import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/My%20Pass/Book_Ride.dart';
import 'package:early_shuttle/User%20Interface/Screens/Home%20Page/HomePage.dart';
import 'package:early_shuttle/Utils/message_utils.dart';
import 'package:flutter/material.dart';

import '../../../Constant/assets.dart';
import '../../../Constant/color.dart';
import '../../Constant Widgets/Container/Container_widget.dart';
import '../../Constant Widgets/TextStyling/AppBarTitle.dart';
import '../../Constant Widgets/TextStyling/smallTextStyle.dart';
import '../../Constant Widgets/TextStyling/subtitleStyle.dart';

class SelectTimeSlot extends StatefulWidget {
  final String navigateStatus;
   SelectTimeSlot({required this.navigateStatus});

  @override
  State<SelectTimeSlot> createState() => _SelectTimeSlotState();
}

class _SelectTimeSlotState extends State<SelectTimeSlot> {
  List<RouteList> itemList = [
    RouteList('9:00 AM','45','0','0'),
    RouteList('9:30 AM','20','15','3'),
    RouteList('11:00 PM','100','52','2'),
    RouteList('02:00 PM','80','76','1'),
    RouteList('4:30 PM','100','32','3'),
   ];
  var selectedTimeSlot;
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
          Title: "Select Time Slot",
          fontSize: 25,
        ),
      ),
      body: CustomContainer(
        width: widths,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: AlignmentDirectional.topCenter,
          colors: [
            ColorConstant.gradientLightblue,
            ColorConstant.gradientLightGreen,
          ],
        ),
        margin: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(width: 1,color: Colors.black),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitle_Text(
                  width: widths/1.5,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  Title: "Sector- 21 Metro Station Dwarka",
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(width: 15,),
                Image.asset(Graphics.mapIcon,scale: widths/40,)
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Graphics.orangeRound, width: widths/20,),
                const SizedBox(width: 15,),
                Small_Text(
                  width: widths/1.9,
                  Title: "Sector- 21 Metro Station Dwarka  ",
                  textColor: Colors.black,
                ),
                const SizedBox(width: 8,),
                Image.asset(Graphics.busFace, width: widths/20,),
                Small_Text(
                  alignment: Alignment.centerRight,
                  width: widths/6,
                  Title: "Distance \n0.08 km",
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Graphics.bluePin, width: widths/30,),
                const SizedBox(width: 15,),
                Small_Text(
                  width: widths/1.9,
                  Title: "Rohini Vihar East Metro Station",
                  textColor: Colors.black,
                ),
                const SizedBox(width: 8,),
                Image.asset(Graphics.busFace, width: widths/20,),
                Small_Text(
                  alignment: Alignment.centerRight,
                  width: widths/6,
                  Title: "Distance \n0.08 km",
                )
              ],
            ),
            const Divider(),
            const SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitle_Text(
                  fontWeight: FontWeight.bold,
                  Title: "Timing",
                ),
                // SubTitle_Text(
                //   fontWeight: FontWeight.bold,
                //   Title: "Total",
                // ),
                SubTitle_Text(
                  fontWeight: FontWeight.bold,
                  Title: "Available",
                )
              ],
            ),
            const SizedBox(height: 15,),
            Container(
              height: heights/2,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: itemList.length,
                  itemBuilder: (context,index){
                return  CustomContainer(
                  color:selectedTimeSlot== itemList[index].time.toString()? Colors.white:Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                     color: selectedTimeSlot== itemList[index].time.toString()? ColorConstant.darkBlackColor.withOpacity(0.3):Colors.transparent,
                      offset: Offset(0,4),
                      blurRadius: 2, spreadRadius: 0,
                    )
                  ],
                  onTap: (){
                    setState(() {
                      selectedTimeSlot= itemList[index].time.toString();
                    });
                  },
                  borderRadius: BorderRadius.circular(5),
                  border:selectedTimeSlot== itemList[index].time.toString()?Border.all(width: 0.5, color: ColorConstant.greyColor):
                  Border.all(width: 0, color: ColorConstant.greyColor.withOpacity(0)),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SubTitle_Text(
                        padding: EdgeInsets.only(left: 5),
                        width: widths/5,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.centerLeft,
                        Title: itemList[index].time,
                      ),
                      Container(
                        width: widths/5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SubTitle_Text(
                                  textColor:itemList[index].status=="0"?ColorConstant.greyColor:ColorConstant.darkBlackColor,
                                  alignment: Alignment.centerRight,
                                  Title: itemList[index].left,
                                ),
                                const SizedBox(width: 5,),
                                ImageIcon(const AssetImage(Graphics.seaticon,), color:itemList[index].status=="0"?ColorConstant.greyColor: Colors.green,size: widths/15),
                              ],
                            ),
                           itemList[index].status.toString()=="2"?
                           Small_Text(
                              textColor: Colors.green,
                              Title: "Filling Fast",
                            ):
                           itemList[index].status.toString()=="3"?
                           Small_Text(
                             textColor: Colors.red,
                             Title: "Few left",
                           ):
                           itemList[index].status.toString()=="0"?
                           Small_Text(
                             textColor: ColorConstant.greyColor,
                             Title: "Not Avl.",
                           ):
                           const SizedBox()
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
      bottomSheet: PrimaryButton(
        onTap: (){
          if(selectedTimeSlot != null){
            widget.navigateStatus=="1"? Navigator.push(context, MaterialPageRoute(builder: (context)=>BookRide())):
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
          }
        else{
          Utils.flushBarErrorMessage("Select a valid time slot", context);
          }
        },
        margin: EdgeInsets.only(left: 20, right: 20,bottom: 25, top: 10),
        Label: "Confirm",
      ),
    );
  }
}

class RouteList {
  final String time;
  final String total;
  final String left;
  final String status;

  RouteList(this.time, this.total, this.left, this.status);
}
// Status Management for the tickets......
// 1= none..
// 2= filling fast..
//3= few seats are left..