import 'package:fithouse_app/config/size_config.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/route_generator.dart';
import '../../widgets/f_h_back_app_bar.dart';

class MultiSelectableContainers extends StatefulWidget {
  @override
  _MultiSelectableContainersState createState() =>
      _MultiSelectableContainersState();
}

class _MultiSelectableContainersState extends State<MultiSelectableContainers> {
  List<bool> isSelectedList = List.generate(16, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:FHAppWidget.appBar(context, "FitHouse", FHColor.appColor,true),
        body: Container(
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
                    value: 0.6,
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
                          'WHAT DO YOU NOT EAT?',
                          style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]
                  )
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Left Column
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[0] = !isSelectedList[0];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelectedList[0] ? FHColor.appColor : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/fish.png',color: isSelectedList[0] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'FISH',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[0] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[1] = !isSelectedList[1];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[1] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),
                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/shrimp.png',color: isSelectedList[1] ? Colors.white:FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'SHELLFISH',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[1] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                  isSelectedList[2] = !isSelectedList[2];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[2] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                      color: FHColor.appColor ,
                                      width: 1,
                                    )
                                  ),
                                  padding: EdgeInsets.all(30),
                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/chicken.png',color: isSelectedList[2] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'TURKEYS',
                                        style: TextStyle(
                                        fontSize: 16,
                                        color: isSelectedList[2] ? Colors.white : FHColor.appColor,
                                        ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                setState(() {
                                isSelectedList[3] = !isSelectedList[3];
                                });
                                },
                                child: Container(
                                decoration: BoxDecoration(
                                    color: isSelectedList[3] ? FHColor.appColor : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                    color: FHColor.appColor ,
                                    width: 1,
                                )
                                ),
                                padding: EdgeInsets.all(30),

                                width: SizeConfig.width/2.5,
                                child: Column(
                                children: [
                                    Image.asset('assets/icons/tree_nuts.png',color: isSelectedList[3] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                    SizedBox(height: 10),
                                    Text(
                                    'TREE NUTS',
                                    style: TextStyle(
                                    fontSize: 16,
                                    color: isSelectedList[3] ? Colors.white : FHColor.appColor,
                                ),
                                ),
                                ],
                                ),
                                ),
                                ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[4] = !isSelectedList[4];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[4] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/egg.png',color: isSelectedList[4] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'EGG',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[4] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[5] = !isSelectedList[5];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[5] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/gluten.png',color: isSelectedList[5] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'GLUTEN',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[5] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[6] = !isSelectedList[6];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[6] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/sesame.png',color: isSelectedList[6] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'SASAME',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[6] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[7] = !isSelectedList[7];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[7] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/husk.png',color: isSelectedList[7] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'PSYLLIUM HUSK',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[7] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                      // Right Column
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[8] = !isSelectedList[8];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[8] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/meat.png',color: isSelectedList[8] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'BEEF',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[8] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[9] = !isSelectedList[9];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[9] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/chicken-leg.png',color: isSelectedList[9] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'CHICKEN',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[9] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[10] = !isSelectedList[10];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[10] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/spicy.png',color: isSelectedList[10] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'SPICY',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[10] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[11] = !isSelectedList[11];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[11] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/bottle.png',color: isSelectedList[11] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'DIARY',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[11] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[12] = !isSelectedList[12];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[12] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/soy.png',color: isSelectedList[12] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'SOY',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[12] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[13] = !isSelectedList[13];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[13] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/beans.png',color: isSelectedList[13] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'BEANS',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[13] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[14] = !isSelectedList[14];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[14] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/peanut.png',color: isSelectedList[14] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'PEANUT',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[14] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedList[15] = !isSelectedList[15];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isSelectedList[15] ? FHColor.appColor : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FHColor.appColor ,
                                        width: 1,
                                      )
                                  ),
                                  padding: EdgeInsets.all(30),

                                  width: SizeConfig.width/2.5,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/icons/pine-cone.png',color: isSelectedList[15] ? Colors.white : FHColor.appColor,height: 30,width: 30,fit: BoxFit.fitWidth),
                                      SizedBox(height: 10),
                                      Text(
                                        'PINECONE',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelectedList[15] ? Colors.white : FHColor.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        'Chances are that your dietary plan might have ingredients that you do not eat.We will show a warning sign next to meals that have those ingredients so that you can swap them with other meal options.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: SizeConfig.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Button onPressed logic
                            Navigator.pushNamed(context, RouteGenerator.dietaryRoute);
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
                    ],
                  ),
                ),
              ),
            ]
          ),
        ),
    );
  }
}
