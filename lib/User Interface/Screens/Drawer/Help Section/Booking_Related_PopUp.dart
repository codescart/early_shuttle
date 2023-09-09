import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:flutter/material.dart';

import '../../../../Constant/color.dart';
import '../../../Constant Widgets/Container/Container_widget.dart';
import '../../../Constant Widgets/TextStyling/smallTextStyle.dart';
import '../../../Constant Widgets/TextStyling/titleStyle.dart';

class BookingRelatedPopUp extends StatefulWidget {
  const BookingRelatedPopUp({Key? key}) : super(key: key);

  @override
  State<BookingRelatedPopUp> createState() => _BookingRelatedPopUpState();
}

class _BookingRelatedPopUpState extends State<BookingRelatedPopUp> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.bounceOut,
      child: CustomContainer(
        padding: EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleStyle(
              textColor: ColorConstant.darkBlackColor,
              alignment: Alignment.center,
              Title: "Thankyou",
            ),
            SizedBox(height: 10,),
            SubTitle_Text(
              textAlign: TextAlign.center,
              Title: "Message Submitted Successfully, we shall get back to you shortly."
            )
          ],
        ),
      ),
    );
  }
}
