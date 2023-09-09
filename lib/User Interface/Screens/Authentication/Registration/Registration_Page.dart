import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Home%20Page/HomePage.dart';
import 'package:early_shuttle/Utils/message_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController= TextEditingController();
  final TextEditingController emailController= TextEditingController();
  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.primaryColor,
      body:CustomContainer(
        alignment: Alignment.bottomCenter,
        height: heights, width: widths,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            HeadingOne(
              padding: const EdgeInsets.only(left: 25),
              fontSize: 30,
              fontWeight: FontWeight.w600,
              Title: "Superb!!!",
            ),
            const SizedBox(height: 25,),
            HeadingOne(
              padding: const EdgeInsets.only(left: 25),
              fontWeight: FontWeight.w600,
              Title: "Let's Get Shuttling",
            ),
            SizedBox(height: heights/20,),
            CustomContainer(
              padding: const EdgeInsets.only(left: 10, right: 10),
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstant.gradientLightGreen,
                  ColorConstant.gradientLightblue
                ],
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60)
              ),
              height: heights/1.8,
              child: Column(
                children: [
                  SizedBox(height: heights/20,),
                  CustomTextField(
                    fieldRadius: BorderRadius.circular(10),
                    label: "Name",
                    hintSize: 20,
                    controller: nameController,
                    fontSize: 22,
                    fillColor: ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: ColorConstant.greyColor.withOpacity(0.8)),
                    width: widths/1.1,
                  ),
                  SizedBox(height: heights/40,),
                  CustomTextField(
                    fieldRadius: BorderRadius.circular(10),
                    label: "Email Address",
                    hintSize: 20,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    fontSize: 22,
                    fillColor: ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: ColorConstant.greyColor.withOpacity(0.8)),
                    width: widths/1.1,
                  ),
                  SizedBox(height: heights/20,),
                  PrimaryButton(
                    onTap: (){
                     if(nameController.text.isEmpty  && emailController.text.isEmpty){
                       Utils.flushBarErrorMessage("Enter a valid details ", context);
                     }
                     else if(nameController.text.isEmpty){
                       Utils.flushBarErrorMessage("Enter a valid Name", context);
                     }
                     else if(emailController.text.isEmpty){
                       Utils.flushBarErrorMessage("Enter a valid Email", context);
                     }
                     else{
                       Utils.toastMessage("Register Succesfully");
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const Homepage()));
                     }
                    },
                    color: ColorConstant.primaryColor,
                    textColor:ColorConstant.whiteColor,
                    fontSize: 20,
                    width: widths/1.1,
                    Label: "Register",
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
