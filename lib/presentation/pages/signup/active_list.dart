import 'package:fithouse_app/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_back_app_bar.dart';

class ActiveList extends StatefulWidget {
  const ActiveList({Key? key}) : super(key: key);

  @override
  State<ActiveList> createState() => _ActiveListState();
}

class _ActiveListState extends State<ActiveList> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:FHAppWidget.appBar(context, "FitHouse", FHColor.appColor,true),
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
                  value: 0.4,
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
                        'HOW ACTIVE ARE YOU?',
                        style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]
                )
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteGenerator.notEatRoute);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0,top: 10.0,right: 20.0,bottom: 10.0),
                padding: EdgeInsets.all(15),
                width: SizeConfig.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FHColor.appColor,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Little or no exercise',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteGenerator.notEatRoute);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0,top: 10.0,right: 20.0,bottom: 10.0),
                padding: EdgeInsets.all(15),
                width: SizeConfig.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FHColor.whiteColor,
                    border: Border.all(
                      color: FHColor.appColor ,
                      width: 1,
                    )
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '1-3 workouts/week',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: FHColor.appColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteGenerator.notEatRoute);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0,top: 10.0,right: 20.0,bottom: 10.0),
                padding: EdgeInsets.all(15),
                width: SizeConfig.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FHColor.whiteColor,
                    border: Border.all(
                      color: FHColor.appColor ,
                      width: 1,
                    )
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '4-5 workouts/week',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: FHColor.appColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteGenerator.notEatRoute);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0,top: 10.0,right: 20.0,bottom: 10.0),
                padding: EdgeInsets.all(15),
                width: SizeConfig.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FHColor.whiteColor,
                  border: Border.all(
                    color: FHColor.appColor ,
                    width: 1,
                  )
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '6-7 workouts/week',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: FHColor.appColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

