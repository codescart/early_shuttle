import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Booking_Related_PopUp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WantToCall extends StatefulWidget {
  const WantToCall({Key? key}) : super(key: key);

  @override
  State<WantToCall> createState() => _WantToCallState();
}

class _WantToCallState extends State<WantToCall> {
  var selectedOption;
  var isSeleted;

  void _sendEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'tripathiji183@gmail.com', // Replace with the recipient's email address
      queryParameters: {
        'subject': 'Need help regarding shuttle', // Specify the subject
        'body': 'whats going on',       // Specify the body
      },
    );

    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
        showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());

    } else {
      throw 'Could not launch email';
    }
  }

  void _openDialPad(String phoneNumber) async {
    final Uri _phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunch(_phoneLaunchUri.toString())) {
      await launch(_phoneLaunchUri.toString());

        showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());
    } else {
      throw 'Could not launch dial pad';
    }
  }


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
          Title: "Want to Call",
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
              SizedBox(height: 10,),
              SubTitle_Text(
                Title: "Want to Call/ Write to Us.",
              ),
              SizedBox(height: 20,),
              Divider(),
              ExpansionTile(
                onExpansionChanged: (v){
                  _sendEmail();
                },
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "info@earlyshuttle.com",
                ),
              ),
              Divider(),
              ExpansionTile(
                onExpansionChanged: (v){
                  _openDialPad('6565922753');
                },
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "Customer Support Number",
                ),
              ),
              Divider(),
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
