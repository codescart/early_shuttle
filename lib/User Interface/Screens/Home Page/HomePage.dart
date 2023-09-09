import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/drawer_widget.dart';
import 'package:early_shuttle/User%20Interface/Screens/Home%20Page/Evening_Tab.dart';
import 'package:early_shuttle/User%20Interface/Screens/Home%20Page/MorningTab.dart';
import 'package:early_shuttle/User%20Interface/Screens/Notification/FullScreen_Notification.dart';
import 'package:early_shuttle/User%20Interface/Screens/Notification/Notification_Screen.dart';
import 'package:flutter/material.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

@override
  void initState() {
  Future.delayed(Duration(seconds: 2), () {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return FullPageNotification(
          message: "This is a full-page notification.",
        );
      },
    );
  });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        drawer: const drawer_widget(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:ColorConstant.primaryColor,
          leadingWidth: 50,
          leading: IconButton(onPressed: (){
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            }
            else {
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          }, icon: const Icon(Icons.menu,size: 35,color: Colors.white,)),
          title:  HeadingOne(
            Title: "Early Shuttle",
            fontSize: 25,
          ),
          actions: [
            NotificationIcon(),
          const SizedBox(width: 15,)
          ],
          bottom: TabBar(
            indicatorWeight: 1.3,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: ColorConstant.greyColor,
            tabs: [
              Tab(
                child: TitleStyle(
                  Title:"Morning"
                )
              ),
              Tab(
                child:TitleStyle(
                  Title: "Evening",
                )
              )
            ],
          ),
        ),

        body: const TabBarView(
          children: <Widget>[
            Morning_Tab(),
            Evening_Tab(),
          ],
        ),
      ),
    );
  }
}

