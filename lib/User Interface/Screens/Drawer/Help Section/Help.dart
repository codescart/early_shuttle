import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Booking_Related.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Others.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Payment_Related.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Service_Area_Timing.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Want_To_Call.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Rides%20Section/RidesHistory_Screen.dart';
import 'package:early_shuttle/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../Constant Widgets/Container/Container_widget.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        leadingWidth: 50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: ColorConstant.whiteColor,
          ),
        ),
        title: HeadingOne(
          Title: "Help",
          fontSize: 25,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: ColorConstant.whiteColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.email, color: ColorConstant.whiteColor)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.calendar_view_day,
                  color: ColorConstant.whiteColor))
        ],
      ),
      body: CustomContainer(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            HeadingOne(
              alignment: Alignment.center,
              textColor: ColorConstant.darkBlackColor,
              Title: "We are always ready to help",
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RidesHistory(status: "1")));
                  },
                  width: widths / 3.5,
                  height: widths / 3,
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
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1)
                  ],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: widths / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.helpSectionTripR),
                                fit: BoxFit.cover)),
                      ),
                      CustomContainer(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        width: widths / 2.5,
                        height: 30,
                        color: Colors.white,
                        child: Small_Text(
                          alignment: Alignment.center,
                          Title: "Trip Related",
                        ),
                      )
                    ],
                  ),
                ),
                CustomContainer(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookingRelated()));
                  },
                  width: widths / 3.5,
                  height: widths / 3,
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
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1)
                  ],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: widths/5,
                        height: widths / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.helpSectionBookR),
                                fit: BoxFit.contain)),
                      ),
                      CustomContainer(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        width: widths / 2.5,
                        height: 30,
                        color: Colors.white,
                        child: Small_Text(
                          Title: "Booking Related",
                        ),
                      )
                    ],
                  ),
                ),
                CustomContainer(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServiceAreaTiming()));
                  },
                  width: widths / 3.5,
                  height: widths / 3,
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
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1)
                  ],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: widths/5,
                        height: widths / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.helpSectionServiceR),
                                fit: BoxFit.contain)),
                      ),
                      CustomContainer(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        width: widths / 2.5,
                        height: 30,
                        color: Colors.white,
                        child: Small_Text(
                          Title: "Service area",
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentRelated()));
                  },
                  width: widths / 3.5,
                  height: widths / 3,
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
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1)
                  ],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: widths/5,
                        height: widths / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.helpSectionPayR),
                                fit: BoxFit.contain)),
                      ),
                      CustomContainer(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        width: widths / 2.5,
                        height: 30,
                        color: Colors.white,
                        child: Small_Text(
                          textAlign: TextAlign.center,
                          Title: "Payment Related",
                        ),
                      )
                    ],
                  ),
                ),
                CustomContainer(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const WantToCall()));
                  },
                  width: widths / 3.5,
                  height: widths / 3,
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
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1)
                  ],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: widths/5,
                        height: widths / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.helpSectionCallR),
                                fit: BoxFit.contain)),
                      ),
                      CustomContainer(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        width: widths / 2.5,
                        height: 30,
                        color: Colors.white,
                        child: Small_Text(
                          textAlign: TextAlign.center,
                          alignment: Alignment.center,
                          Title: "Call/Write to Us",
                        ),
                      )
                    ],
                  ),
                ),
                CustomContainer(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const OtherHelp()));
                  },
                  width: widths / 3.5,
                  height: widths / 3,
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
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1)
                  ],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: widths/5,
                        height: widths / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.helpSectionOtherR),
                                fit: BoxFit.contain)),
                      ),
                      CustomContainer(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        width: widths / 2.5,
                        height: 30,
                        color: Colors.white,
                        child: Small_Text(
                          Title: "Others",
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
