import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/assets.dart';
import '../../../../Constant/color.dart';
import '../../../Constant Widgets/Container/Container_widget.dart';
import '../../../Constant Widgets/TextStyling/AppBarTitle.dart';
import '../../../Constant Widgets/TextStyling/smallTextStyle.dart';

class BookRide extends StatefulWidget {
  const BookRide({Key? key}) : super(key: key);

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
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
          Title: "Book Ride",
          fontSize: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            CustomContainer(
              width: widths,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: AlignmentDirectional.topCenter,
                colors: [
                  ColorConstant.gradientLightblue,
                  ColorConstant.gradientLightGreen,
                ],
              ),
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
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitle_Text(
                        fontWeight: FontWeight.w600,
                        Title:"Timing",
                      ),
                      SubTitle_Text(
                        Title:"12:25 Pm",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            CustomContainer(
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstant.gradientLightGreen,
                  ColorConstant.gradientLightblue
                ],
              ),
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(width: 1,color: Colors.black),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitle_Text(
                        fontWeight: FontWeight.w600,
                        Title:"Total Amount: ",
                      ),
                      SubTitle_Text(
                        Title:"₹ 10598",
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitle_Text(
                        fontWeight: FontWeight.w600,
                        Title:"Amount Payable:",
                      ),
                      SubTitle_Text(
                        Title:"₹ 10598",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            CustomContainer(
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstant.gradientLightGreen,
                  ColorConstant.gradientLightblue
                ],
              ),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              borderRadius: BorderRadius.circular(5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleStyle(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        fontWeight: FontWeight.w600,
                        textColor: ColorConstant.darkBlackColor,
                        Title: "Pay Now: ",
                      ),
                      SubTitle_Text(
                        padding: EdgeInsets.only(right: 10),
                        alignment: FractionalOffset.centerRight,
                        width:widths/3 ,
                        Title:"₹ 10598",
                      ) ,
                    ],
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){

                    },
                    contentPadding: EdgeInsets.all(0),
                    // leading: Image.asset(Graphics.paytm),
                    title: PrimaryButton(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      textColor: Colors.black,
                      alignment: Alignment.centerLeft,
                      Label: "Make Payment",
                    ),
                    // trailing: SubTitle_Text(
                    //   padding: EdgeInsets.only(right: 10),
                    //   alignment: FractionalOffset.centerRight,
                    //   width:widths/3 ,
                    //   Title:"₹ 10598",
                    // ) ,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
