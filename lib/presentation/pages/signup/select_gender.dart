import 'package:flutter/material.dart';

import '../../../config/size_config.dart';
import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_back_app_bar.dart';

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:FHAppWidget.appBar(context, "FitHouse"),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    minHeight: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(FHColor.appColor),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'WHAT’S YOUR GENDER?',
                          style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    // padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    selectedColor: FHColor.bgTextFieldColor,
                    backgroundColor:Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8),topLeft:Radius.circular(8),bottomLeft: Radius.circular(8) )),
                    label: Column(
                      children: [
                        Image.asset('assets/icons/male.png',color: FHColor.appColor,height: 100,width: 100,fit: BoxFit.fitWidth,),
                        // Text('Male'),
                        Container(
                            margin: EdgeInsets.only(left: 10.0,top: 15.0,right: 10.0,bottom: 10.0),
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color:  FHColor.appColor ,
                                // color: Colors.yellow[100],
                                border: Border.all(
                                  color: FHColor.appColor ,
                                  width: 1,
                                )
                            ),
                            child: Center(child: Text('Male'.toUpperCase(),style: TextStyle(color: FHColor.appColor,fontSize: 20,) ))
                        )
                      ],
                    ),
                    selected: selectedGender == 'Male',
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedGender = 'Male';
                        } else {
                          selectedGender = null;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  ChoiceChip(
                    // padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    selectedColor: FHColor.bgTextFieldColor,
                    backgroundColor:Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8),topLeft:Radius.circular(8),bottomLeft: Radius.circular(8) )),
                    label: Column(
                      children: [
                        Image.asset('assets/icons/female.png',color: FHColor.appColor,height: 100,width: 100,fit: BoxFit.fitWidth,),
                        // Text('Female'),
                        Container(
                            margin: EdgeInsets.only(left: 10.0,top: 15.0,right: 10.0,bottom: 10.0),
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color:  FHColor.appColor ,
                                // color: Colors.yellow[100],
                                border: Border.all(
                                  color: FHColor.appColor ,
                                  width: 1,
                                )
                            ),
                            child: Center(child: Text('Female'.toUpperCase(),style: TextStyle(color: FHColor.appColor,fontSize: 20,) ))
                        )
                      ],
                    ),
                    selected: selectedGender == 'Female',
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedGender = 'Female';
                        } else {
                          selectedGender = null;
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: SizeConfig.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Use the selected gender in your logic
                      if (selectedGender != null) {
                        // Do something with selectedGender
                        Navigator.pushNamed(context, RouteGenerator.activeRoute);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: FHColor.appColor,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    child: Text('next'.toUpperCase()),
                  ),
                ),
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Men and women have different metabolic profiles and nutritional needs.',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ]
                    )
                ),
              ),

            ]
        ),
      ),
    );
  }
}
