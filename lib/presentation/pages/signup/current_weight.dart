import 'package:fithouse_app/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_back_app_bar.dart';

class CurrentWeight extends StatefulWidget {
  const CurrentWeight({Key? key}) : super(key: key);

  @override
  State<CurrentWeight> createState() => _CurrentWeightState();
}

class _CurrentWeightState extends State<CurrentWeight> {
  int _value = 0;
  int _valueH = 0;
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  void _increment() {
    print(_value);
    setState(() {
      _value++;
      _textEditingController.text = _value.toString();
    });
  }

  void _decrement() {
    if (_value > 0) {
      setState(() {
        _value--;
        _textEditingController.text = _value.toString();
      });
    }
  }

  void _heightincrement() {
    print(_valueH);
    setState(() {
      _valueH++;
      _heightController.text = _valueH.toString();
    });
  }

  void _heightdecrement() {
    if (_valueH > 0) {
      setState(() {
        _valueH--;
        _heightController.text = _valueH.toString();
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _textEditingController.text = _value.toString();
    _heightController.text = _valueH.toString();
  }

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
                    value: 0.3,
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
                          'YOUR PROFILE',
                          style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]
                  )
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Tell us your current weight',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration (
                        color: FHColor.appColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove,color: Colors.white,size: 28,),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: _decrement,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: FHColor.accentColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _textEditingController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter weight',
                                ),
                              ),
                            ),
                            Text(
                              'kg',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration (
                        color: FHColor.appColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add,color: Colors.white,size: 28,),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: _increment,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'And your height?',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration (
                        color: FHColor.appColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove,color: Colors.white,size: 28,),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: _heightdecrement,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: FHColor.accentColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _heightController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter height',
                                ),
                              ),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration (
                        color: FHColor.appColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add,color: Colors.white,size: 28,),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: _heightincrement,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // bottom: 16.0, // Adjust the bottom position as needed
                left: 16.0, // Adjust the left position as needed
                right: 16.0, // Adjust the right position as needed
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: SizeConfig.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Button click logic
                        Navigator.pushNamed(context, RouteGenerator.targetWeightRoute);
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

              ),
            ],
          ),
        ),
    );
  }
}

