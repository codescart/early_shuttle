
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/Text_Button.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class FullPageNotification extends StatelessWidget {
  final String message;

  FullPageNotification({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close button at the top-right corner
          // Align(
          //   alignment: Alignment.topRight,
          //   child: IconButton(
          //     icon: Icon(Icons.cancel_outlined, color: Colors.red,),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ),
          // Notification message
          Image(image: AssetImage(Assets.assetsFullScr)),
          SizedBox(height: 15,),
          Text_Button(
            onTap: (){
              Navigator.of(context).pop();
            },
            fontWeight: FontWeight.w600,
            fontSize: 25,
            Title: "close",
            textColor: Colors.red,
          )
        ],
      ),
    );
  }
}
