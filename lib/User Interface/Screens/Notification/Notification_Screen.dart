import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Notifiy> itemList = [
    Notifiy('12-05-2023','Welcome', 'Hello welcome you to early shuttle hope you are enjoy this app'),
    Notifiy('25-05-2023','Exciting offers ', 'We have various offers for you make trips easier with early shuttle'),
    Notifiy('02-08-2023','Something new', 'We are introduce you new feature that allow you to reserve your seat before the day of journey'),
    Notifiy('27-08-2023','Unlock your Saving', 'Congratulations! You have unlocked a special discount. Hurry,this is valid until midnight today.'),
     ];

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,size: 20,color: ColorConstant.whiteColor,),),
        title:HeadingOne(
          fontWeight: FontWeight.w600,
          Title: "Notification",
        ),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
          itemBuilder: (context, index){
        return CustomContainer(
          margin: EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorConstant.gradientLightGreen,
              ColorConstant.gradientLightblue
            ],
          ),
          // padding: EdgeInsets.all(10),
          child: ExpansionTile(
            iconColor: ColorConstant.blueColor,
            initiallyExpanded: true,
            tilePadding: EdgeInsets.only(left: 5, right: 5, bottom: 0),
            // initiallyExpanded: true,
            leading: Icon(Icons.notifications),
            title: SubTitle_Text(
              alignment: Alignment.centerLeft,
              fontSize: 18,
              textAlign: TextAlign.left,
              Title: itemList[index].title,
            ),
            trailing: Small_Text(
              width: widths/5,
              textAlign: TextAlign.right,
              Title: itemList[index].Date,
            ),
              children: [
               ListTile(
                 subtitle: SubTitle_Text(
                   textAlign: TextAlign.left,
                   Title: itemList[index].content,
                 ),
               )
            ],
          ),
        );
      }),
    );
  }
}

class Notifiy {
  final String Date;
  final String title;
  final String content;
  Notifiy(this.Date, this.title, this.content);
}
// Notification Icon for Home Page
class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
                size: 28
            ),
            onPressed: () {
              // Handle notification icon tap
            },
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '3', // Replace with your notification count
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
          )
        ],
      ),
    );
  }
}