import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:flutter/material.dart';

import 'Booking_Related_PopUp.dart';

class PaymentRelated extends StatefulWidget {
  const PaymentRelated({Key? key}) : super(key: key);

  @override
  State<PaymentRelated> createState() => _PaymentRelatedState();
}

class _PaymentRelatedState extends State<PaymentRelated> {
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
          Title: "Payment Related",
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
              // SizedBox(height: 10,),
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
                  Title: "Unable to buy pass.",
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
                  Title: "Money deducated but ride not confirmed.",
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
                  Title: "Payment Failed.",
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
