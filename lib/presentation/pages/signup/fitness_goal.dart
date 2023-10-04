import 'package:fithouse_app/config/size_config.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:fithouse_app/utils/route_generator.dart';
import 'package:flutter/material.dart';

import '../../widgets/f_h_back_app_bar.dart';

class FitnessGoal extends StatefulWidget {
  const FitnessGoal({Key? key}) : super(key: key);

  @override
  State<FitnessGoal> createState() => _FitnessGoalState();
}

class _FitnessGoalState extends State<FitnessGoal> {
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
                    value: 0.2,
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
                              'WHAT’S YOUR FITNESS GOAL?',
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
                      color: isTapped ? FHColor.appColor : Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/weight-loss.png',color: FHColor.appColor,height: 100,width: 100,fit: BoxFit.fitWidth,),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lose Weight',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20,height: 10,),
                            Text(
                              "We'll help you with a safe & healthy rate of weight and fat loss,while preserving your muscle and athletic performance.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
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
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/icons/muscle.png',color: FHColor.appColor,height: 100,width: 100,fit: BoxFit.fitWidth,),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gain Muscle',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 20,height: 10,),
                                    Text(
                                      "If you're looking to build up muscles,this is for you. We'll recommend the best macronutrients to Gain Muscle & muscle while minimizing fat gain.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
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
                          // color: Colors.white,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/icons/weight-maintain.png',color: FHColor.appColor,height: 100,width: 100,fit: BoxFit.fitWidth,),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Maintain Weight',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 20,height: 10,),
                                    Text(
                                      "Happy with your current weight but still want to eat healthy, wholesome food? You're at the right place.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
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
        )
    );
  }
}
