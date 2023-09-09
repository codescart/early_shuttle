import 'dart:io';

import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Custom%20Shape/CustomShape.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/subtitleStyle.dart';
import 'package:early_shuttle/User%20Interface/Screens/Drawer/Profile/Map_For_Address.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../Constant/color.dart';
import '../../../Constant Widgets/Calender/Calender.dart';
import '../../../Constant Widgets/TextStyling/smallTextStyle.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController Name = TextEditingController();
  TextEditingController DateOfBirth = TextEditingController();
  TextEditingController Gender = TextEditingController();

// Calender for DOB select...............
  DateTime selectedDate = DateTime.now();
  var formattedDate;
  void _handleDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
      formattedDate = DateFormat.yMd().format(selectedDate);
      DateOfBirth = formattedDate;
    });
  }

  // Image picker for profile........
  File? _image;
  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  String? selectedGender;
  List<String> genders = ['Male', 'Female',];

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
        child: SingleChildScrollView(
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
                            ColorConstant.primaryColor,
                          ],
                        ),
                        color: ColorConstant.primaryColor,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Positioned(
                    top: heights/9,
                    child:  CircleAvatar(
                      radius: 70,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
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
                      )),
                  Positioned(
                    bottom: heights/90,
                      right: widths/3.5,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo,size: 30,), onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context)=>choose( context)
                        );
                      },
                      )),
                ],
              ),
              SingleChildScrollView(
                child: CustomContainer(
                  margin:const EdgeInsets.only(left: 10, right: 10, top: 5),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
                  height: heights/1.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextField(
                          borderRadius: BorderRadius.circular(10),
                          fieldRadius: BorderRadius.circular(10),
                          fillColor:ColorConstant.whiteColor,
                          border: Border.all(width: 1, color: ColorConstant.greyColor),
                          prefix: const Icon(Icons.person),
                          label: "Name",
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          controller: DateOfBirth,
                          borderRadius: BorderRadius.circular(10),
                          fieldRadius: BorderRadius.circular(10),
                          fillColor:ColorConstant.whiteColor,
                          border: Border.all(width: 1, color: ColorConstant.greyColor),
                          prefix: DatePickerWidget(
                            initialDate: selectedDate,
                            onDateSelected: _handleDateSelected,
                          ),
                          label: "Date of Birth",
                        ),
                        const SizedBox(height: 8,),
                        CustomContainer(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConstant.whiteColor,
                          border: Border.all(width: 1, color: ColorConstant.greyColor),
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Icon(Icons.select_all),
                              SizedBox(width: 15,),
                              DropdownButton<String>(
                                underline: SizedBox(),
                                value: selectedGender,
                                hint: SubTitle_Text(
                                  alignment: Alignment.centerLeft,
                                  width: widths/1.6,
                                  Title: "Select Gender",
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedGender = newValue!;
                                  });
                                },
                                items: genders.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          borderRadius: BorderRadius.circular(10),
                          fieldRadius: BorderRadius.circular(10),
                          fillColor:ColorConstant.whiteColor,
                          border: Border.all(width: 1, color: ColorConstant.greyColor),
                          prefix: const Icon(Icons.home),
                          label: "Home Address",
                          sufix: CustomContainer(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PlacesSearchWidget()));
                            },
                            width: widths/12,
                            child: Icon(Icons.location_on_outlined),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          borderRadius: BorderRadius.circular(10),
                          fieldRadius: BorderRadius.circular(10),
                          fillColor:ColorConstant.whiteColor,
                          border: Border.all(width: 1, color: ColorConstant.greyColor),
                          prefix: const Icon(Icons.location_city_rounded),
                          label: "Office Address",
                          sufix: CustomContainer(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PlacesSearchWidget()));
                            },
                            width: widths/12,
                            child: Icon(Icons.location_on_outlined),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          borderRadius: BorderRadius.circular(10),
                          fieldRadius: BorderRadius.circular(10),
                          fillColor:ColorConstant.whiteColor,
                          border: Border.all(width: 1, color: ColorConstant.greyColor),
                          prefix: const Icon(Icons.email),
                          label: "Email",
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          borderRadius: BorderRadius.circular(10),
                          fieldRadius: BorderRadius.circular(10),
                          fillColor:ColorConstant.whiteColor,
                          border: Border.all(width: 1, color: ColorConstant.greyColor),
                          prefix: const Icon(Icons.phone),
                          label: "Phone",
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          borderRadius: BorderRadius.circular(10),
                          fieldRadius: BorderRadius.circular(10),
                          fillColor:ColorConstant.whiteColor,
                          border: Border.all(width: 1, color: ColorConstant.greyColor),
                          prefix: const Icon(Icons.drive_file_rename_outline),
                          label: "Company Name",
                        ),
                        const SizedBox(height: 20,),
                        PrimaryButton(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const editProfile()));
                          },
                          borderRadius: BorderRadius.circular(5),
                          fontSize: 20,
                          Label: "Save Changes",
                          textColor: ColorConstant.whiteColor,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // widget for open bottom modal sheet to select image picking option.
  Widget choose(BuildContext context){
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubTitle_Text(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textColor: ColorConstant.darkBlackColor,
                padding: EdgeInsets.only(left: 15),
                Title: "Chooose Option",
              ),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.cancel_outlined, color: Colors.red,))
            ],
          ),
          ListTile(
            leading: Icon(Icons.camera_alt, color: ColorConstant.greyColor,size: 30,),
            title: SubTitle_Text(
                alignment: Alignment.centerLeft,
                Title:'Open Camera'
            ),
            subtitle: Small_Text(
              alignment: Alignment.centerLeft,
              Title: "Open Camera to click Image now",
            ),
            onTap: () {
              _getImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_camera_back, color: ColorConstant.greyColor,),
            title: SubTitle_Text(
                alignment: Alignment.centerLeft,
                Title:'Open File'
            ),
            subtitle: Small_Text(
              alignment: Alignment.centerLeft,
              Title: "Open Galary to choose from images",
            ),
            onTap: () {
              _getImage(ImageSource.gallery);

            },
          ),

          SizedBox(height: 20,)
          // Add more options as needed
        ],
      ),
    );
  }

}

