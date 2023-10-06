import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
          Container(
            margin: const EdgeInsets.only(
                left: 20.00, top: 120.00, right: 0.0, bottom: 20.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Log in'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white54,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w700,
                      fontSize: 60,
                      letterSpacing: 2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle login button tap
                        // Navigate to the login screen or perform any other action
                        Navigator.pushNamed(context, RouteGenerator.loginRoute);
                      },
                  ),
                  TextSpan(
                    text: '  Sign up'.toUpperCase(),
                    style: TextStyle(
                      color: FHColor.whiteColor,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w700,
                      fontSize: 60,
                      letterSpacing: 2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle login button tap
                        // Navigate to the login screen or perform any other action
                        Navigator.pushNamed(
                            context, RouteGenerator.signupRoute);
                      },
                  ),
                ],
              ),
            ),
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
                              'Full Name',
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
                              prefixIcon: Icon(Icons.account_circle_sharp),
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
                              hintText: "Full Name",
                              errorText: null,
                              counterText: "",
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          validator: (v) {
                            if (v == null) {
                              return "Full Name is Required *";
                            } else if (v.isEmpty) {
                              return "Full Name is Required *";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              'Phone Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ),
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
                            // Perform Signup logic here
                            if (formKey.currentState!.validate()) {
                              await ValidateOtp(context);
                            }
                            print("button clicked");
                            // getUser();
                          },
                          child: Text('Continue',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              'By continuing, you agree to our Terms and Privacy Policy',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
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
    final mapData = {
      'otp': otpController.text.toString(),
    };

    final response = await http.post(
      Uri.parse('http://172.105.60.113/fithouse/fithouse/api/signup.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(mapData),
    );

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
