import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Explore_Route/Explore_Routes_List.dart';
import 'package:flutter/material.dart';

class ServiceAreaTiming extends StatefulWidget {
  const ServiceAreaTiming({Key? key}) : super(key: key);

  @override
  State<ServiceAreaTiming> createState() => _ServiceAreaTimingState();
}

class _ServiceAreaTimingState extends State<ServiceAreaTiming> {
  var selectedOption;
  var isSeleted;

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
          Title: "Service area & Timing",
          fontSize: 25,
        ),
      ),
      body: CustomContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              HeadingOne(
                alignment: Alignment.center,
                fontSize: widths/20,
                textColor: ColorConstant.darkBlackColor,
                Title: "Once selected the trip details to open",
              ),
              // SizedBox(height: 10,),
              // SubTitle_Text(
              //   Title: "Under this following option will appear",
              // ),
              SizedBox(height: 20,),
              Divider(),
              ExpansionTile(
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "Shuttle not available near my location",
                ),
              ),
              Divider(),
              ExpansionTile(
                onExpansionChanged: (v){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ExploreRouteList()));
                },
                trailing: SizedBox(),
                leading: Icon(Icons.star,),
                title: SubTitle_Text(
                  alignment: Alignment.centerLeft,
                  Title: "Suggest new time slot",
                ),
              ),
              Divider(),

            ],
          ),
        ),
      ),
    );
  }
}

// to show text box for the selection of different boxes accorind to need
// driver beaviour = 1
// vehicle not clean = 2
// Ac not work = 3
