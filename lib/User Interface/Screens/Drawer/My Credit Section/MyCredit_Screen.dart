import 'package:early_shuttle/Constant/assets.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Reserve%20Seat/Select_Time_Slot.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Rides%20Section/MyRides.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/color.dart';
import '../../../Constant Widgets/TextStyling/AppBarTitle.dart';

class MyCredit extends StatefulWidget {
  const MyCredit({Key? key}) : super(key: key);

  @override
  State<MyCredit> createState() => _MyCreditState();
}

class _MyCreditState extends State<MyCredit> {

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
          Title: "My Credit",
          fontSize: 25,
        ),
      ),
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
              margin: const EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(width: 1,color: Colors.black),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          TitleStyle(
                            // alignment: Alignment.centerLeft,
                            // width: widths/1.4,
                            Title: "No of times Cancelled: 1",
                            textColor: Colors.black,
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(Graphics.orangeRound, scale: heights/70,),
                              const SizedBox(width: 15,),
                              Small_Text(
                                alignment: Alignment.centerLeft,
                                width: widths/1.4,
                                Title: "Sector- 21 Metro Station Dwarka",
                                textColor: Colors.black,
                              ),
                              const SizedBox(width: 8,),
                              Image.asset(Graphics.busFace, scale: widths/25,)
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(Graphics.bluePin, scale: heights/60,),
                              const SizedBox(width: 15,),
                              Small_Text(
                                alignment: Alignment.centerLeft,
                                width: widths/1.4,
                                Title: " Rohini Vihar East Metro Station",
                                textColor: Colors.black,
                              ),
                              const SizedBox(width: 8,),
                              Image.asset(Graphics.busFace, scale: widths/25,)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Small_Text(
                            alignment: Alignment.centerLeft,
                            width: widths/1.8,
                            Title: "Expiry On: 2023-05-23",
                          ),
                          Small_Text(
                            alignment: Alignment.centerLeft,
                            width: widths/1.8,
                            Title: "Time: 9:25 AM",
                          ),
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset(Graphics.qrscan, scale: widths/40,)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(Graphics.busFace, scale: widths/40,),
                          const SizedBox(width: 5,),
                          Small_Text(
                            Title: "Bus No:\nUP60AF2358",
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person, color: Colors.orange,),
                          const SizedBox(width: 5,),
                          Small_Text(
                            Title: "Driver Name:\nAshutosh Tripathi",
                          )
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.payment, color: ColorConstant.blueColor,),
                          const SizedBox(width: 5,),
                          Small_Text(
                            Title: "Paid By: Paytm",
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.menu, color: ColorConstant.blueColor,),
                          const SizedBox(width: 5,),
                          Small_Text(
                            Title: "OrderId: 201586",
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.call, color: ColorConstant.blueColor,size: 20,),
                      SubTitle_Text(
                        Title: " Driver Mobile: 9565922548",
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  PrimaryButton(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectTimeSlot(navigateStatus: '1',)));
                    },
                    padding: const EdgeInsets.all(0),
                    Label: "Ride Again",
                    fontSize: 18,
                    textColor: ColorConstant.whiteColor,
                  )
                ],
              ),
            );
          }),
    );
  }
}
