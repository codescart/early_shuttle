
import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Authentication/OTP%20Verification/OTP_Page.dart';
import 'package:early_shuttle/Utils/message_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneNumber= TextEditingController();


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
          children: [
            Spacer(),
            HeadingOne(
              alignment: Alignment.center,
              fontWeight: FontWeight.w600,
              Title: "Welcome to Early Shuttle Family",
            ),
            SizedBox(height: 5,),
            SubTitle_Text(
              textColor: Colors.white,
              textAlign: TextAlign.center,
              Title: "Direct to Office, Close to Home",
            ),
            SizedBox(height: heights/10,),
            HeadingOne(
              alignment: Alignment.center,
              fontWeight: FontWeight.w600,
              Title: "Login",
            ),
            Spacer(),
            SizedBox(height: heights/60,),
            CustomContainer(
              padding: EdgeInsets.only(left: 10, right: 10),
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstant.gradientLightGreen,
                  ColorConstant.gradientLightblue
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60)
              ),
              height: heights/1.8,
              child: Column(
                children: [
                  SizedBox(height: heights/20,),
                  CustomContainer(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,3),
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 2,
                          spreadRadius: 1
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                    width: widths/1.2,
                    height: 60,
                    color: ColorConstant.whiteColor,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10,left: 10, right: 10
                    ),
                    child: CustomTextField(
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      maxLength: 10,
                      fieldRadius: BorderRadius.circular(10),
                      filled: true,
                      height: 40,
                      label: "Phone Number",
                      hintSize: 20,
                      controller: phoneNumber,
                      keyboardType: TextInputType.number,
                      fontSize: 22,
                      fillColor: ColorConstant.greyColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      // border: Border.all(width: 0.5, color: ColorConstant.greyColor.withOpacity(0.8)),
                      width: widths/1.2,
                    ),
                  ),
                  SizedBox(height: heights/30,),
                  CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      controlAffinity:ListTileControlAffinity.leading,
                      value: checkBox, onChanged: (bool? value) {
                    print(value);
                    setState(() {
                      checkBox=value!;
                    });
                  },
                      title: Text.rich(
                        TextSpan(
                          text: 'I\'ve read and agreed to share my ',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          children: [
                            TextSpan(
                              text: 'Personally Identifiable Information and other Information.',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorConstant.blueColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline
                              ),
                            ),
                          ],
                        ),
                      )
                    // Small_Text(Title: "I've read and agreed to share my "),
                  ),
                  SizedBox(height: heights/40,),
                  PrimaryButton(
                    onTap: (){
                      if(checkBox == true) {
                       if(phoneNumber.text.isNotEmpty){
                         if (phoneNumber.length == 10) {
                           Navigator.pushReplacement(context, MaterialPageRoute(
                               builder: (context) =>
                                   opt_page(phoneNumber: phoneNumber.text)));
                         }
                         else{
                           Utils.flushBarErrorMessage("Enter a valid Phone Number", context);
                         }
                       }
                       else{
                         Utils.flushBarErrorMessage("Enter a valid Phone Number", context);
                       }
                      }
                      else{
                        Utils.flushBarErrorMessage("Agreement with the Terms and Conditions is required to proceed ", context);
                      }
                    },
                    color: checkBox== false?ColorConstant.greyColor :ColorConstant.primaryColor,
                    textColor:ColorConstant.whiteColor,
                    fontSize: 20,
                    width: widths/1.2,
                    Label: "Send OTP",
                  ),
                  SizedBox(height: heights/15,),
                  SubTitle_Text(
                    Title: "Contact Us",
                  ),
                  SizedBox(height: 6,),
                  CustomContainer(
                    onTap: (){
                      _launchEmail();
                    },
                    gradient: LinearGradient(
                      tileMode: TileMode.mirror,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorConstant.gradientLightGreen,
                        ColorConstant.gradientLightblue
                      ],
                    ),
                    border: Border.all(
                        width: 0.1, color: ColorConstant.greyColor
                    ),
                    height: 40, width: 40,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2,2),
                          spreadRadius: 0,
                          blurRadius: 0,
                          color: ColorConstant.darkBlackColor.withOpacity(0.5),
                          blurStyle: BlurStyle.outer
                      )
                    ],
                    child: Icon(Icons.mail_outline, color: ColorConstant.blueColor,),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Open email for contact.........................

  _launchEmail() async {
    var email = "tripathiji183@gmail.com";
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("email not login")));
    }
  }
}




