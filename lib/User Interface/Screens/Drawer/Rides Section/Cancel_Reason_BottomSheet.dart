import 'package:early_shuttle/Constant/color.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Buttons/PrimaryButton.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Text%20Field/TextField_widget.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/TextStyling/titleStyle.dart';
import 'package:early_shuttle/Utils/message_utils.dart';
import 'package:flutter/material.dart';
import '../../../Constant Widgets/TextStyling/subtitleStyle.dart';

class CancelReason extends StatefulWidget {
  const CancelReason({Key? key}) : super(key: key);

  @override
  State<CancelReason> createState() => _CancelReasonState();
}

class _CancelReasonState extends State<CancelReason> {
  final otherReason = TextEditingController();
  int? _selectedItem;
  void _handleItemChanged(int index) {
    setState(() {
      if (_selectedItem == index) {
        _selectedItem = -1; // Deselect the item if it's already selected
      } else {
        _selectedItem = index;
      }
    });
  }
  // List<String> items = [
  //   'Getting late to catch',
  //   'Need to leave early',
  //   'Pooling with someone',
  //   'Changed my plan',
  //   'Vehicle/ Driver quality issue'
  // ];
 var selValue;
  List<String> items = [
    'Changed my plan',
    'No shuttle available',
    'Getting late to catch',
    'Other',
  ];
  List<CheckboxListTile> _buildCheckboxListTiles() {

    List<CheckboxListTile> checkboxes = [];

    for (int i = 0; i < items.length; i++) {
      checkboxes.add(
        CheckboxListTile(
          dense: true,
          contentPadding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
          controlAffinity: ListTileControlAffinity.leading,
          title: SubTitle_Text(
              alignment: Alignment.centerLeft,
              Title:items[i]
          ),
          value: _selectedItem == i,
          onChanged: (value){
            selValue= items[i];
            print(selValue);
            _handleItemChanged(i);
          }
        ),
      );
    }

    return checkboxes;
  }

  @override
  Widget build(BuildContext context) {
    final heights =MediaQuery.of(context).size.height;
    final widths =MediaQuery.of(context).size.width;
    return Dialog(
      child: SingleChildScrollView(
        child: CustomContainer(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorConstant.gradientLightGreen,
              ColorConstant.gradientLightblue
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.cancel_outlined, color: Colors.red,))
                ],
              ),
              TitleStyle(
                textColor: ColorConstant.darkBlackColor,
                padding: const EdgeInsets.only(left: 15, right: 15),
                alignment: Alignment.centerLeft,
                Title: "Select reason to process the ticket cancellation.",
              ),
              const Divider(),
              Column(
                  children:_buildCheckboxListTiles()
              ),
              selValue.toString() == items.last.toString()?
              CustomTextField(
                controller: otherReason,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.only(left: 15, right: 15),
                label: "Write here",
                maxLines: 4,
                height: 80,
              ):const SizedBox(),
              const SizedBox(height: 15,),
              PrimaryButton(
                onTap: (){
                  if(_selectedItem == null){
                    Utils.flushBarErrorMessage("Select a valid reason to process the cancellation", context);
                  }
                  else{
                    if(selValue.toString() == items.last.toString()){
                      if(otherReason.text.isEmpty){
                        Utils.flushBarErrorMessage("Enter a valid reason", context);
                      }
                      else{
                        Utils.toastMessage("Request sucessully submitted");
                        Navigator.pop(context);
                      }
                    }
                    else{
                      Utils.toastMessage("Request sucessully submitted");
                      Navigator.pop(context);
                    }
                  }
                },
                width:widths/2 ,
                Label: "Continue",
                margin: const EdgeInsets.only(left: 15,right: 15, top: 10, bottom: 20),
              )
              // Add more options as needed
            ],
          ),
        ),
      ),
    );
  }
}
