import 'package:early_shuttle/Constant/assets.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Rides%20Section/Cancel_Reason_BottomSheet.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Rides%20Section/Reschedule_Popup.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/color.dart';

class CurrentRides extends StatefulWidget {
  const CurrentRides({Key? key}) : super(key: key);

  @override
  State<CurrentRides> createState() => _CurrentRidesState();
}

class _CurrentRidesState extends State<CurrentRides> {

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: 5,
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
            margin: EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(5),
            // border: Border.all(width: 1,color: Colors.black),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu, color: ColorConstant.blueColor,),
                        SizedBox(width: 5,),
                        SubTitle_Text(
                          Title: "OrderId: 201586",
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.lock_open_rounded, color: ColorConstant.blueColor,),
                        SizedBox(width: 5,),
                        SubTitle_Text(
                          Title: "OTP: 4892",
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(Graphics.orangeRound, scale: heights/70,),
                            SizedBox(width: 15,),
                            Small_Text(
                              alignment: Alignment.centerLeft,
                              width: widths/1.5,
                              Title: "Sector- 21 Metro Station Dwarka  ",
                              textColor: Colors.black,
                            ),
                            // Image.asset(Graphics.busFace, scale: widths/25,)
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(Graphics.bluePin, scale: heights/60,),
                            SizedBox(width: 15,),
                            Small_Text(
                              alignment: Alignment.centerLeft,
                              width: widths/1.5,
                              Title: " Rohini Vihar East Metro Station",
                              textColor: Colors.black,
                            ),
                            // Image.asset(Graphics.busFace, scale: widths/25,)
                          ],
                        ),
                      ],
                    ),
                    Image.asset(Graphics.qrscan, scale: widths/60),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 5,),
                        Small_Text(
                          Title: "Date: \n2023-05-23",
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timelapse),
                        SizedBox(width: 5,),
                        Small_Text(
                          Title: "Time: \n09:25 AM",
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(Graphics.busFace, scale: widths/30,),
                        SizedBox(width: 5,),
                        Small_Text(
                          Title: "Bus No:\nUP60AF2358",
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.payment),
                        SizedBox(width: 5,),
                        Small_Text(
                          Title: "Payment By:\nPayMode",
                        )
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.orange,),
                        SizedBox(width: 5,),
                        Small_Text(
                          Title: "Driver Name:\nAshutosh Tripathi",
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 5,),
                        Small_Text(
                          Title: "Driver Mobile:\n9565922548",
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(
                      color: Colors.transparent,
                      textColor: ColorConstant.whiteColor,
                      // fontSize: 11,
                      width: widths/2.5,
                      Label: "Track Your Ride",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map),
                          SizedBox(width: 5,),
                          SubTitle_Text(
                            textColor: ColorConstant.blueColor,
                            Title: "Track Your Ride",
                          )
                        ],
                      ),
                    ),
                    PrimaryButton(
                      textColor: ColorConstant.whiteColor,
                      color: Colors.transparent,
                      // fontSize: 11,
                      width: widths/2.5,
                      Label: "Click to Board!",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.departure_board_sharp),
                          SizedBox(width: 5,),
                          SubTitle_Text(
                            textColor: ColorConstant.blueColor,
                            Title: "Click to Board!",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(
                      onTap: (){
                        showDialog(context: context, builder: (BuildContext context)=>ReschedulePopup());
                      },
                      width: widths/2.5,
                      Label: "Reschedule",
                    ),
                    PrimaryButton(
                      onTap: (){
                        showDialog(context: context, builder: (BuildContext context)=>CancelReason());
                      },
                      color: Colors.red,
                      width: widths/2.5,
                      Label: "Cancel",
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
