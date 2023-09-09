import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Coupon/CouponsScreen.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Help%20Section/Help.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/My%20Credit%20Section/MyCredit_Screen.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/My%20Pass/BuyPass.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/My%20Pass/MyPass_Screen.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Profile/ViewProfile.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Refer&Earn/Refer_Earn_Screen.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Rides%20Section/MyRides.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Safety%20Zone.dart';
import 'package:early_shuttle/User%20Interface/Screens/Home%20Page/SearchForNewPage.dart';
import 'package:flutter/material.dart';

import 'Explore_Route/Explore_Routes_List.dart';

class drawer_widget extends StatelessWidget {
  const drawer_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewProfile()));
            },
            child:  DrawerHeader(
              decoration: BoxDecoration(
                color: ColorConstant.primaryColor,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: ColorConstant.primaryColor
                ),
                accountName: Text(
                  "Ashutosh tripathi",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("abc@gamil.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  radius: 50,
                  backgroundColor: ColorConstant.primaryColor,
                  child:Icon(
                    Icons.person,size: 40,color: Colors.black,
                  ),
                  //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ),
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.content_paste_sharp),
            title: const Text(' My Pass '),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPassScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_bus_outlined),
            title: const Text(' My Rides '),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyRidesScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text(' My Credit '),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCredit()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.share_outlined),
            title: const Text('Refer & Earn'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ReferEarn()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer_outlined),
            title: const Text('Coupons'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CouponsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.health_and_safety_outlined),
            title: const Text('Safety Zone'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SafetyZone()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.route),
            title: const Text('Expolore Route'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ExploreRouteList()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline_outlined),
            title: const Text('Help'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
            },
          ),
          SizedBox(height: 30,),
          PrimaryButton(
            color: Colors.red,
            margin: EdgeInsets.only(left: 15, right: 15),
            Label: "Logout",
          )
        ],
      ),
    );
  }
}
