import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Reserve%20Seat/Select_Pass_Information.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/color.dart';
import '../../../Constant Widgets/Container/Container_widget.dart';

class SelectedPassInformation extends StatefulWidget {
  final String? route1;
  final String? route2;
   SelectedPassInformation({this.route1, this.route2}) ;

  @override
  State<SelectedPassInformation> createState() => _SelectedPassInformationState();
}

class _SelectedPassInformationState extends State<SelectedPassInformation> {
  int _selectedItem = -1;
  void _handleItemChanged(int index) {
    setState(() {
      if (_selectedItem == index) {
        _selectedItem = -1; // Deselect the item if it's already selected
      } else {
        _selectedItem = index;
      }
    });
  }
  List<CheckboxListTile> _buildCheckboxListTiles() {
    List<String> items = [
      'Weekly 10 Rides \n(Valid for 9 calender days)(100)',
      'Weekly 30 Rides \n(Valid for 30 calender days)(2100)',
      'Weekly 5 Rides \n(Valid for 9 calender days)(50)',
      'Weekly 15 Rides \n(Valid for 30 calender days)(1050)',
      'Weekly 50 Rides \n(Valid for 45 calender days)(100)'
    ];
    List<CheckboxListTile> checkboxes = [];

    for (int i = 0; i < items.length; i++) {
      checkboxes.add(
        CheckboxListTile(
          dense: true,
          contentPadding: EdgeInsets.all(0),
          controlAffinity: ListTileControlAffinity.leading,
          title: Small_Text(
            alignment: Alignment.centerLeft,
            Title:items[i]
          ),
          value: _selectedItem == i,
          onChanged: (value) => _handleItemChanged(i),
        ),
      );
    }

    return checkboxes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        leadingWidth: 50,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 20,color: ColorConstant.whiteColor,),),
        title:  HeadingOne(
          Title: "Select Pass Information",
          fontSize: 25,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            CustomContainer(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedPassInformation()));
              },
              color: ColorConstant.whiteColor,
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
                    offset: Offset(0,3),
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 2,
                    spreadRadius: 1
                )
              ],
              margin: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(width: 1,color: Colors.black),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Small_Text(
                    Title:"Route 1-  "+widget.route1.toString(),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Small_Text(
                    Title:"Route 2-  "+ widget.route2.toString(),
                  ),
                  SizedBox(height: 15,),
                  PrimaryButton(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    Label: "Change Route",
                  ),
                ],
              ),
            ),
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
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,3),
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 2,
                    spreadRadius: 1
                )
              ],
              margin: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(5),
              padding: EdgeInsets.all(10),
              child: Column(
                  children:_buildCheckboxListTiles()
              )
            ),
            SizedBox(height: 15,),
            SubTitle_Text(
              padding: EdgeInsets.only(left: 10),
              textColor: ColorConstant.blueColor,
              Title:"Unused rides will not be carried forward for Special passes"
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
      bottomSheet:PrimaryButton(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectPassInfo()));
        },
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
        Label: "Next",
      ) ,
    );
  }
}
