import 'package:early_shuttle/Constant/assets.dart';
import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Reserve%20Seat/Select_Time_Slot.dart';
import 'package:early_shuttle/User%20Interface/Screens/Home%20Page/Image_Slider.dart';
import 'package:early_shuttle/User%20Interface/Screens/Home%20Page/SearchForNewPage.dart';
import 'package:early_shuttle/User%20Interface/Screens/Reserve%20Seat/Select_Pass_Information.dart';
import 'package:early_shuttle/User%20Interface/Screens/SelectRoute/Selecet_route.dart';
import 'package:flutter/material.dart';

class Morning_Tab extends StatefulWidget {
  const Morning_Tab({Key? key}) : super(key: key);
  @override
  State<Morning_Tab> createState() => _Morning_TabState();
}
class _Morning_TabState extends State<Morning_Tab> {
  final from= TextEditingController();
  final to= TextEditingController();

  String fromLocation = '';
  String toLocation = '';

  void _selectLocation(String locationType) async {
    final selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchForPage(locationType: locationType),
      ),
    );

    if (selectedLocation != null) {
      setState(() {
        if (locationType == 'from') {
          fromLocation = selectedLocation;
        } else if (locationType == 'to') {
          toLocation = selectedLocation;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return CustomContainer(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
      gradient: LinearGradient(
        tileMode: TileMode.mirror,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          ColorConstant.gradientLightGreen,
          ColorConstant.gradientLightblue
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              padding: const EdgeInsets.only(left: 5, top: 15, right: 5,bottom: 15),
              width: widths,
                color: ColorConstant.whiteColor,
                border: Border.all(width: 0.5, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: widths/10,
                        child: Column(
                          children: [
                            Image.asset(Graphics.orangeRound, scale: heights/80,),
                            Transform.rotate(
                                angle:3.15 ,
                                child: Icon(Icons.straight, size: heights/25,)),
                            Image.asset(Graphics.bluePin, scale: heights/60,)
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            fontSize: 12,
                            controller: from..text=fromLocation,
                            enabled: false,
                            onTap: (){
                              _selectLocation('from');
                            },
                            border: Border.all(width: 0.5, color: ColorConstant.greyColor.withOpacity(0.5)),
                            fieldRadius: BorderRadius.circular(5),
                            borderRadius: BorderRadius.circular(5),
                            width: widths/1.6,
                            filled: true,
                            fillColor: ColorConstant.whiteColor,
                            label:"Pickup Near Home",
                          ),
                         SizedBox(height: heights/50,),
                          CustomTextField(
                            fontSize: 12,
                            controller: to..text= toLocation,
                            enabled: false,
                            onTap: (){
                              _selectLocation('to');
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchForPage()));
                            },
                            border: Border.all(width: 0.5, color: ColorConstant.greyColor.withOpacity(0.5)),
                            fieldRadius: BorderRadius.circular(5),
                            borderRadius: BorderRadius.circular(5),
                            width: widths/1.6,
                            filled: true,
                            fillColor: ColorConstant.whiteColor,
                            label:"Drop Near office",
                          ),
                        ],
                      ),
                      CustomContainer(
                        onTap: (){
                          if(from.text == fromLocation && to.text == toLocation){
                            print("interchange");
                              from..text = toLocation;
                              to..text = fromLocation;
                          }
                          else if(from.text == toLocation && to.text == fromLocation){
                            print("same same");
                              from..text = fromLocation;
                              to..text = toLocation;
                          }
                        },
                        alignment: Alignment.centerLeft,
                        width:widths/10,
                        child:  Icon(Icons.swap_vert,color: ColorConstant.darkBlackColor,size: 35,)
                      )
                    ],
                  ),
                  SizedBox(height: heights/40,),
                  PrimaryButton(
                    width: widths/1.6,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Select_route()),);
                    },
                    Label: "Find Route",
                    icon: Icons.save,
                    textColor: ColorConstant.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ColorConstant.primaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: heights/60,),
            CustomContainer(
              borderRadius: BorderRadius.circular(8),
              // alignment: Alignment.center,
              // height: heights/10,
              color: ColorConstant.whiteColor,
              child: ExpansionTile(
                tilePadding: EdgeInsets.only(left: 10, right: 10),
                  childrenPadding: EdgeInsets.only(left: 10, right: 10),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitle_Text(
                        width: widths/3,
                        textColor: ColorConstant.blueColor,
                        alignment: Alignment.centerLeft,
                        Title: "Current Ride",
                      ),
                      SubTitle_Text(
                        alignment: Alignment.centerRight,
                        fontSize:  widths/30,
                        width: widths/2.6,
                        Title: "OrderId: 204856",
                      ),
                    ],
                  ),
              subtitle:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Small_Text(
                    alignment: Alignment.centerLeft,
                    Title: "2023-05-23 at 09:30 AM",
                    // Title: "OTP:2048",
                  ),
                  SubTitle_Text(
                    alignment: Alignment.centerRight,
                    fontSize: widths/30,
                    width: widths/3,
                    Title: "OTP: 2048",
                  ),
                ],
              ),
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(Graphics.orangeRound, scale: heights/60,),
                              SizedBox(width: 15,),
                              SubTitle_Text(
                                alignment: Alignment.centerLeft,
                                width: widths/1.5,
                                Title: "Sector- 21 Metro Station Dwarka  ",
                                textColor: Colors.black,
                              ),
                             ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(Graphics.bluePin, scale: heights/50,),
                              SizedBox(width: 15,),
                              SubTitle_Text(
                                alignment: Alignment.centerLeft,
                                width: widths/1.5,
                                Title: "Rohini Vihar East Metro Station",
                                textColor: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: widths/1.2,
                            child: Row(
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
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(Icons.person, color: Colors.orange,),
                                    SizedBox(width: 5,),
                                    Small_Text(
                                      Title: "Driver Phone:\n9565927867",
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
           SizedBox(height: heights/60,),
           CustomContainer(
             color: ColorConstant.whiteColor,
             borderRadius: BorderRadius.circular(10),
             padding: const EdgeInsets.all(8),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     SubTitle_Text(
                       padding: const EdgeInsets.only(left: 10),
                       Title: "Quick Book- 10:00 AM",
                       fontWeight: FontWeight.w600,
                     ),
                     PrimaryButton(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectTimeSlot(navigateStatus:"1")));
                       },
                       padding: const EdgeInsets.all(2),
                       width: widths/3.5,
                       height: 40,
                       Label: "Reserve Seat",
                       textColor: ColorConstant.whiteColor,
                     ),
                   ],
                 ),
                 const SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Column(
                       children: [
                         Image.asset(Graphics.orangeRound, scale: heights/50,),
                         Transform.rotate(
                             angle:3.15 ,
                             child: Icon(Icons.straight, size: heights/35,)),
                         Image.asset(Graphics.bluePin, scale: heights/40,)
                       ],
                     ),
                     SizedBox(width: 10,),
                     Column(
                       children: [
                         // SizedBox(height: 20,),
                         Small_Text(
                           alignment: Alignment.centerLeft,
                           fontSize: 14,
                           width: widths/1.4,
                           Title: "Sector- 21 Metro Station Dwarka",
                           textColor: Colors.black,
                         ),
                         const SizedBox(height: 20,),
                         Small_Text(
                           alignment: Alignment.centerLeft,
                           fontSize: 14,
                           width: widths/1.4,
                           Title: "Rohini Vihar East Metro Station",
                           textColor: Colors.black,
                         ),
                       ],
                     ),
                   ],
                 ),
                 const Divider(),
                 Small_Text(
                   Title: "Route- 32, Dwarka Mor-Sector 56 Gulf Course Road",
                 ),
                 const SizedBox(height: 10,),
               ],
             ),
           ),
            SizedBox(height: heights/60,),
            HomePageImageSlider()
          ],
        ),
      ),
    );
  }
}
