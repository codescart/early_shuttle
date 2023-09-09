import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Booking_Related_PopUp.dart';
import 'package:flutter/material.dart';

class OtherHelp extends StatefulWidget {
  const OtherHelp({Key? key}) : super(key: key);

  @override
  State<OtherHelp> createState() => _OtherHelpState();
}

class _OtherHelpState extends State<OtherHelp> {
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
          Title: "Others",
          fontSize: 25,
        ),
      ),
      body: CustomContainer(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SubTitle_Text(
              alignment: Alignment.centerLeft,
              Title: "Write Us",
            ),
            SizedBox(height: 10,),
            CustomTextField(
              contentPadding: EdgeInsets.all(10),
              maxLines: 6,
              height:heights/5 ,
              label: "Write your Query/ Problem",
            ),
            SizedBox(height: 20,),
            PrimaryButton(
              onTap: (){
                  showDialog(context: context, builder: (BuildContext context)=>BookingRelatedPopUp());
              },
              Label: "Submit",
            )
          ],
        ),
      ),
    );
  }
}
