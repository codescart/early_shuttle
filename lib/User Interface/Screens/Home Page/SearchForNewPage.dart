import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/AppBarTitle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/smallTextStyle.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../../../Constant/color.dart';


class SearchForPage extends StatefulWidget {
  final String locationType;
  const SearchForPage({super.key, required this.locationType});

  @override
  State<SearchForPage> createState() => _SearchForPageState();
}

class _SearchForPageState extends State<SearchForPage> {

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  // Fetch Places data on the behalf of search........
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _suggestions = [];

  Future<void> _getSuggestions(String input) async {
    const apiKey = 'AIzaSyBKIlvYYdvExdOrvjZZFxvm1KsAC99aLzM'; // Replace with your API key
    final endpoint = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey',
    );

    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final predictions = data['predictions'];
      if (kDebugMode) {
        print("saaaaaaaaaaaaaaaaaa");
      }
      if (kDebugMode) {
        print(predictions);
      }
      setState(() {
        _suggestions = predictions
            .map((prediction) => prediction['description'] as String)
            .toList();
      });
    }
  }

  // Get live location......
  String locationText = 'Location: Not available';
  Future<void> _getLocation() async {
    await Geolocator.requestPermission();
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        locationText =
        'Location: ${position.latitude}, ${position.longitude}';

      });
      _getAddress(LatLng(position.latitude, position.longitude));
    }
    catch (e) {
      if (kDebugMode) {
        print('Error getting location: $e');
      }
      setState(() {
        locationText = 'Location: Error';
      });
    }
  }
  // Fetch live location from lat lan..............
  var liveLocation;
  Future _getAddress(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0];
    setState(() {
      liveLocation = "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
    });// get only first and closest address
    if (kDebugMode) {
      print("location -- "+liveLocation);
    }
  }


  bool? change = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor:ColorConstant.primaryColor,
        leading:IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,size:20 ,)),
        title: HeadingOne(
          Title: "Search Location",
        ),
        bottom: PreferredSize(
          preferredSize: Size(width,50),
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: CustomTextField(
              autofocus:true,
              controller: _searchController,
              onChanged: _getSuggestions,
              width: width/1.1,
              height: 45,
              filled: true,
              fillColor: ColorConstant.whiteColor,
              label:"Enter the location",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                CustomContainer(
                  borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      tileMode: TileMode.mirror,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorConstant.gradientLightGreen,
                        ColorConstant.gradientLightblue
                      ],
                    ),
                  child: ExpansionTile(
                      collapsedTextColor: Colors.black,
                      textColor: Colors.black,
                      tilePadding: const EdgeInsets.only(left: 10, right: 10),
                      childrenPadding: const EdgeInsets.all(0),
                      title: SubTitle_Text(
                        alignment: Alignment.centerLeft,
                        Title: "Quick Address Selections",
                      ),
                        // style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w500),),
                      children:[
                        ListTile(
                          onTap: (){
                            final location = liveLocation;
                            Navigator.pop(context, location);
                          },
                            minLeadingWidth: 20,
                            leading: Icon(Icons.location_on,color:ColorConstant.blueColor,size: 23,),
                            title: SubTitle_Text(
                              alignment: Alignment.centerLeft,
                              Title:'Current Location',
                            ),
                          subtitle: Small_Text(
                              alignment: Alignment.centerLeft,
                              maxLines: 2, overflow: TextOverflow.ellipsis,
                              Title: liveLocation,
                          textColor: ColorConstant.greyColor
                            ),
                        ),
                        const Divider(),
                        ListTile(
                          onTap: (){
                          },
                            minLeadingWidth: 20,
                            leading: Icon(Icons.home,color: ColorConstant.blueColor,size: 23,),
                            title: SubTitle_Text(
                              alignment: Alignment.centerLeft,
                              Title:'Home',
                            ),
                            subtitle: Small_Text(
                                alignment: Alignment.centerLeft,
                                maxLines: 2, overflow: TextOverflow.ellipsis,
                                Title: "1/789, Sector-H Jankipuram Lucknow",
                                textColor: ColorConstant.greyColor
                            ),
                        ),
                        const Divider(),
                        ListTile(
                          onTap: (){
                          },
                            minLeadingWidth: 20,
                            leading: Icon(Icons.shopping_bag,color: ColorConstant.blueColor,size: 23,),
                            title:SubTitle_Text(
                              alignment: Alignment.centerLeft,
                              Title:'Others',
                            ),
                          subtitle: Small_Text(
                              alignment: Alignment.centerLeft,
                              maxLines: 2, overflow: TextOverflow.ellipsis,
                              Title: "1/70, Alkapuri AdilNagar Lucknow",
                              textColor: ColorConstant.greyColor
                          ),
                        ),
                      ]
                  ),
                ),
                const SizedBox(height: 20,),
                HeadingOne(
                  padding: const EdgeInsets.only(left: 5),
                  fontSize: 18,
                  Title: "Recent Searches",
                  textColor: ColorConstant.darkBlackColor,
                ),
                const SizedBox(height: 10,),
                const Divider(),
                SizedBox(
                  height:height/1.7,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _suggestions.length,
                    itemBuilder: (context, index) {
                      final location = _suggestions[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(Icons.location_on_outlined),
                        title: SubTitle_Text(
                          alignment: Alignment.centerLeft,
                          Title: location,),
                        onTap: () {
                          Navigator.pop(context, location);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
