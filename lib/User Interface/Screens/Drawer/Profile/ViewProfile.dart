import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Custom%20Shape/CustomShape.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Profile/EditProfile.dart';
import 'package:flutter/material.dart';


import '../../../../../Constant/color.dart';

class viewProfile extends StatefulWidget {
  const viewProfile({Key? key}) : super(key: key);

  @override
  State<viewProfile> createState() => _viewProfileState();
}

class _viewProfileState extends State<viewProfile> {


  TextEditingController DOB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomContainer(
        gradient: LinearGradient(
          tileMode: TileMode.mirror,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            ColorConstant.gradientLightGreen,
            ColorConstant.gradientLightblue
          ],
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CustomContainer(
                  height: heights/3.5,
                  child: ClipPath(
                    clipper: CustomShapeprofile(),
                    child: CustomContainer(
                      gradient: LinearGradient(
                        tileMode: TileMode.mirror,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColorConstant.gradientLightblue,
                          ColorConstant.primaryColor.withOpacity(0.5),
                        ],
                      ),
                      color: ColorConstant.primaryColor,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Positioned(
                  top: heights/9,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/male3.png"),
                  ),
                ),
                Positioned(
                  left: 10, top: 35,
                    child: CustomContainer(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(50),
                      width: 50,
                      height: 40,
                      // color: Colors.black.withOpacity(0.5),
                      child: Icon(Icons.arrow_back_ios, size: 25,color: ColorConstant.whiteColor,)
                    ))
              ],
            ),
            SingleChildScrollView(
              child: CustomContainer(

                margin:EdgeInsets.only(left: 10, right: 10, top: 5),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 15, right: 15, top: 12),
                height: heights/1.5,
                child: Column(
                  children: [
                    CustomTextField(
                      enabled: false,
                      borderRadius: BorderRadius.circular(10),
                      fieldRadius: BorderRadius.circular(10),
                      fillColor:ColorConstant.whiteColor,
                      border: Border.all(width: 1, color: ColorConstant.greyColor),
                      prefix: Icon(Icons.person),
                      label: "Name",
                    ),
                    SizedBox(height: 8,),
                    CustomTextField(
                      enabled: false,
                      borderRadius: BorderRadius.circular(10),
                      fieldRadius: BorderRadius.circular(10),
                      fillColor:ColorConstant.whiteColor,
                      border: Border.all(width: 1, color: ColorConstant.greyColor),
                      prefix: Icon(Icons.calendar_month),
                      label: "Date of Birth",
                    ),
                    SizedBox(height: 8,),
                    CustomTextField(
                      enabled: false,
                      borderRadius: BorderRadius.circular(10),
                      fieldRadius: BorderRadius.circular(10),
                      fillColor:ColorConstant.whiteColor,
                      border: Border.all(width: 1, color: ColorConstant.greyColor),
                      prefix: Icon(Icons.gradient),
                      label: "Gender",
                    ),
                    SizedBox(height: 8,),
                    CustomTextField(
                      enabled: false,
                      borderRadius: BorderRadius.circular(10),
                      fieldRadius: BorderRadius.circular(10),
                      fillColor:ColorConstant.whiteColor,
                      border: Border.all(width: 1, color: ColorConstant.greyColor),
                      prefix: Icon(Icons.home),
                      label: "Home Address",
                    ),
                    SizedBox(height: 8,),
                    CustomTextField(
                      enabled: false,
                      borderRadius: BorderRadius.circular(10),
                      fieldRadius: BorderRadius.circular(10),
                      fillColor:ColorConstant.whiteColor,
                      border: Border.all(width: 1, color: ColorConstant.greyColor),
                      prefix: Icon(Icons.location_city_rounded),
                      label: "Office Address",
                    ),
                    SizedBox(height: 8,),
                    CustomTextField(
                      enabled: false,
                      borderRadius: BorderRadius.circular(10),
                      fieldRadius: BorderRadius.circular(10),
                      fillColor:ColorConstant.whiteColor,
                      border: Border.all(width: 1, color: ColorConstant.greyColor),
                      prefix: Icon(Icons.email),
                      label: "Corporate Email",
                    ),
                    SizedBox(height: 8,),
                    CustomTextField(
                      enabled: false,
                      borderRadius: BorderRadius.circular(10),
                      fieldRadius: BorderRadius.circular(10),
                      fillColor:ColorConstant.whiteColor,
                      border: Border.all(width: 1, color: ColorConstant.greyColor),
                      prefix: Icon(Icons.phone),
                      label: "Phone",
                    ),
                    SizedBox(height: 8,),
                    CustomTextField(
                      enabled: false,
                      borderRadius: BorderRadius.circular(10),
                      fieldRadius: BorderRadius.circular(10),
                      fillColor:ColorConstant.whiteColor,
                      border: Border.all(width: 1, color: ColorConstant.greyColor),
                      prefix: Icon(Icons.drive_file_rename_outline),
                      label: "Company Name",
                    ),
                    SizedBox(height: 20,),
                    PrimaryButton(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>editProfile()));
                      },
                      fontSize: 20,
                      Label: "Edit Profile",
                      textColor: ColorConstant.whiteColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
