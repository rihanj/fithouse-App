import 'package:flutter/material.dart';

import '../../../config/size_config.dart';
import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_back_app_bar.dart';

class DietaryPlan extends StatefulWidget {
  const DietaryPlan({Key? key}) : super(key: key);

  @override
  State<DietaryPlan> createState() => _DietaryPlanState();
}

class _DietaryPlanState extends State<DietaryPlan> {
  @override
  Widget build(BuildContext context) {
    bool isTapped = false;
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
                    value: 0.8,
                    minHeight: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(FHColor.appColor),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'CHOOSE YOUR DIETARY PLAN',
                          style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                  )
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    isTapped = !isTapped;
                  });
                  Navigator.pushNamed(context, RouteGenerator.currentWeightRoute);
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: SizeConfig.width,
                  height: 150,
                  padding: EdgeInsets.all(10),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: FHColor.appColor,
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/balance.jfif',color: Colors.white,height: 50,width: 50,fit: BoxFit.cover,),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BALANCED',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                 color: Colors.white
                              ),
                            ),
                            SizedBox(width: 20,height: 10,),
                            Text(
                              "Balanced in proteins,carbs,and fats",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
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
                  Navigator.pushNamed(context, RouteGenerator.currentWeightRoute);
                },
                child:Container(
                  margin: EdgeInsets.only(left: 20,top: 0,right: 20,bottom: 0),
                  width: SizeConfig.width,
                  height: 150,
                  padding: EdgeInsets.all(10),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/low-carb-img.jpg',color: FHColor.appColor,height: 100,width: 100,fit: BoxFit.fitWidth,),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOW-CARB',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(width: 20,height: 10,),
                            Text(
                              "Low on carbohydrates, high on fats, balanced on proteins.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
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
                  Navigator.pushNamed(context, RouteGenerator.currentWeightRoute);
                },
                child:Container(
                  margin: EdgeInsets.all(20),
                  width: SizeConfig.width,
                  height: 150,
                  padding: EdgeInsets.all(10),
                  // color: FHColor.appColor,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VEGETRAIN',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(width: 20,height: 10,),
                            Text(
                              "No meats, poultry or fish",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Image.asset('assets/images/veg.jfif',color: FHColor.appColor,height: 50,width: 50,fit: BoxFit.cover,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
