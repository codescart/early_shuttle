import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Booking_Related_PopUp.dart';
import 'package:flutter/material.dart';

class TripRelated extends StatefulWidget {
  const TripRelated({Key? key}) : super(key: key);

  @override
  State<TripRelated> createState() => _TripRelatedState();
}

class _TripRelatedState extends State<TripRelated> {
  var selectedOption;
  var isSeleted;

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
          Title: "Trip Related",
          fontSize: 25,
        ),
      ),
      body: CustomContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              HeadingOne(
                alignment: Alignment.center,
                fontSize: widths/20,
                textColor: ColorConstant.darkBlackColor,
                Title: "Once selected the trip details to open",
              ),
              // SubTitle_Text(
              //   Title: "Under this following option will appear",
              // ),
              SizedBox(height: 20,),
              Divider(),
             ExpansionTile(
               onExpansionChanged: (v){
                 showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());
               },
               trailing: SizedBox(),
               leading: Icon(Icons.star,),
               title: SubTitle_Text(
                 alignment: Alignment.centerLeft,
                 Title: "The vehicle reported late.",
               ),
             ),
              Divider(),
              ExpansionTile(
                onExpansionChanged: (v){
                  showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());
                },
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "Driver didn't stop at the stop.",
                ),
              ),
              Divider(),
              ExpansionTile(
                onExpansionChanged: (v){
                  showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());
                },
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "The trip couldn't get validated through OTP/Qr code",
                ),
              ),
              Divider(),
              ExpansionTile(
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "The driver behaviour was not good.",
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15, top: 10),
                    child: CustomTextField(
                      height: heights/8,
                      contentPadding: EdgeInsets.all(7),
                      maxLines: 10,
                      label: "Describe about the issue",
                    ),
                  ),
                  SizedBox(height: 10,),
                  PrimaryButton(
                    onTap:() {
                      showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());
                    },
                    margin: EdgeInsets.only(left: 15, right: 15),
                    Label: "Submit",
                  )
                ],
              ),
              Divider(),
              ExpansionTile(
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "Vehicle not cleaned ",
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15, top: 10),
                    child: CustomTextField(
                      height: heights/8,
                      contentPadding: EdgeInsets.all(7),
                      maxLines: 10,
                      label: "Describe about the issue",
                    ),
                  ),
                  SizedBox(height: 10,),
                  PrimaryButton(
                    onTap:() {
                      showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());
                    },
                    margin: EdgeInsets.only(left: 15, right: 15),
                    Label: "Submit",
                  )
                ],
              ),
              Divider(),
              ExpansionTile(
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "AC not working properly ",
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15, top: 10),
                    child: CustomTextField(
                      height: heights/8,
                      contentPadding: EdgeInsets.all(7),
                      maxLines: 10,
                      label: "Describe about the issue",
                    ),
                  ),
                  SizedBox(height: 10,),
                  PrimaryButton(
                    onTap:() {
                      showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());
                    },
                    margin: EdgeInsets.only(left: 15, right: 15),
                    Label: "Submit",
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

// to show text box for the selection of different boxes accorind to need
// driver beaviour = 1
// vehicle not clean = 2
// Ac not work = 3
