import 'package:early_shuttle/Constant/assets.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Help.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Trip_Related.dart';
import 'package:early_shuttle/User%20Interface/Screens/Reserve%20Seat/Select_Time_Slot.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/color.dart';

class RidesHistory extends StatefulWidget {
  final String status;
   RidesHistory({Key? key, required this.status}) : super(key: key);

  @override
  State<RidesHistory> createState() => _RidesHistoryState();
}

class _RidesHistoryState extends State<RidesHistory> {

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(width: 8,),
                              Image.asset(Graphics.busFace, scale: widths/25,)
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
                                Title: "Rohini Vihar East Metro Station",
                                textColor: Colors.black,
                              ),
                              SizedBox(width: 8,),
                              Image.asset(Graphics.busFace, scale: widths/25,)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Small_Text(
                            alignment: Alignment.centerLeft,
                            width: widths/1.8,
                            Title: "Date: 2023-05-23",
                          ),
                          Small_Text(
                            alignment: Alignment.centerLeft,
                            width: widths/1.8,
                            Title: "Time: 9:25 AM",
                          ),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Image.asset(Graphics.qrscan, scale: widths/40,)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(Graphics.busFace, scale: widths/40,),
                          SizedBox(width: 5,),
                          Small_Text(
                            Title: "Bus No:\nUP60AF2358",
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.orange,),
                          SizedBox(width: 5,),
                          Small_Text(
                            Title: "Driver Name:\nAshutosh Tripathi",
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
                          Icon(Icons.payment, color: ColorConstant.blueColor,),
                          SizedBox(width: 5,),
                          Small_Text(
                            Title: "Paid By:Paytm",
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.menu, color: ColorConstant.blueColor,),
                          SizedBox(width: 5,),
                          Small_Text(
                            Title: "OrderId: 201586",
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                 widget.status=="1"? PrimaryButton(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>TripRelated()));
                   },
                   // width: widths/2.5,
                   fontSize: 18,
                   Label: "Need help",
                 ): Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryButton(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectTimeSlot(navigateStatus: '1',)));
                        },
                        width: widths/2.5,
                        fontSize: 18,
                        Label: "Ride Again",
                      ),
                      PrimaryButton(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
                        },
                        width: widths/2.5,
                        fontSize: 18,
                        Label: "Need help",
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
