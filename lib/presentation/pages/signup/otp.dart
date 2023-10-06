import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_themes.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FHColor.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back,
          color: FHColor.appColor,
          size: 24,
        ),
        toolbarHeight: 80,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.support_agent,
                  color: FHColor.appColor,
                  size: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: FHColor.appColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_signup.gif",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20.0, top: 150.0, right: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.white, spreadRadius: 3),
                ],
              ),
              // color: Colors.white,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.00),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              'Enter OTP',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: otpController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              // labelText: 'OTP',
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: FHColor.bgTextFieldColor,
                                    width: 1.7),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: FHColor.bgTextFieldColor,
                              hintStyle: AppTheme.hintTextStyle,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter OTP",
                              errorText: null,
                              counterText: "",
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          validator: (v) {
                            if (v == null) {
                              return "OTP is Required *";
                            } else if (v.isEmpty) {
                              return "OTP is Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: FHColor.appColor,
                              // Text Color (Foreground color)
                              side:
                                  BorderSide(width: 2, color: FHColor.appColor),
                              //border width and color
                              elevation: 3,
                              //elevation of button
                              shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(15)),
                          onPressed: () async {
                            print("tapped");
                            await ValidateOtp(context);
                          },
                          child: Text('Validateee',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future ValidateOtp(context) async {
    print("Validate otp function called");
    final LocalStorage storage = await LocalStorage('Signup-otp');
    print("Signup otp----->>> ${storage.getItem('Signup_otp')}");

    final mapData = {
      'otp': otpController.text.toString(),
    };

    // final response = await http.post(
    //   Uri.parse('http://172.105.60.113/fithouse/fithouse/api/signup.php'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(mapData),
    // );
    //
    print(mapData);
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   // If the server did return a 201 CREATED response,
    //   // then parse the JSON.
    //
    //   // var data = await json.decode(response.toString());
    //   String jsonsDataString = response.body.toString(); //
    //   var data = jsonDecode(jsonsDataString);
    //   print(data);
    //   if (data["status"] == true) {
    //     Navigator.pushNamed(context, RouteGenerator.deliveryRoute);
    //     CSnackBar.successSnackBar(context, data["message"]);
    //   } else {
    //     CSnackBar.errorSnackBar(context, data["message"]);
    //   }
    //   print(data["status"]);
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    //   throw Exception('Failed to create album.');
    // }
    // _Database = await openDB();
    // // UserRepo userRepo = new UserRepo();
    // // userRepo.createtable(_Database);
    //
    // UserModel userModel = new UserModel(fullNameController.text.toString(),emailCodeController.text.toString(),int.tryParse(mobileNumberController.text.toString())!);
    // await _Database?.insert("users",userModel.toMap());
    // await _Database?.close();
  }
}
