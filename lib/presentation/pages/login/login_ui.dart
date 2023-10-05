import 'dart:convert';

import 'package:fithouse_app/data/data_provider/cache_service_imp.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../utils/route_generator.dart';
import '../../widgets/c-snack_bar.dart';
import '../../widgets/f_h_back_app_bar.dart';
import '../../widgets/f_h_themes.dart';
import 'package:lottie/lottie.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool isMobileNumberEntered = false;

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FHColor.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: const Icon(
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
                icon: const Icon(
                  Icons.support_agent,
                  color: FHColor.appColor,
                  size: 24,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 12.0),
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
                left: 20.00, top: 120.00, right: 0.0, bottom: 0.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Log in'.toUpperCase(),
                    style: const TextStyle(
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
                        Navigator.pushNamed(context, RouteGenerator.loginRoute);
                      },
                  ),
                  TextSpan(
                    text: '  Sign up'.toUpperCase(),
                    style: const TextStyle(
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
                        Navigator.pushNamed(
                            context, RouteGenerator.signupRoute);
                      },
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 20.0, top: 240.0, right: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.white, spreadRadius: 3),
              ],
            ),
            // color: Colors.white,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
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
                    Visibility(
                      // visible: isMobileNumberEntered,
                      child: IntlPhoneField(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                        flagsButtonPadding: const EdgeInsets.all(8),
                        dropdownIconPosition: IconPosition.trailing,
                        decoration: InputDecoration(
                            // labelText: 'Phone Number',
                            filled: true,
                            prefixIcon: Icon(Icons.phone),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: FHColor.bgTextFieldColor, width: 1.7),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fillColor: FHColor.bgTextFieldColor,
                            hintStyle: AppTheme.hintTextStyle,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            hintText: "xxxxxxxxxx",
                            errorText: null,
                            counterText: "",
                            errorStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        initialCountryCode: 'SA',
                        onChanged: (value) {
                          print(value.completeNumber);
                          setState(() {
                            isMobileNumberEntered =
                                value != null ? true : false;
                          });
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                    ),
                    Visibility(
                      visible: isMobileNumberEntered,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            'Verification Code',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isMobileNumberEntered,
                      child: TextField(
                        controller: verificationCodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            // labelText: 'Verification Code',
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: FHColor.bgTextFieldColor, width: 1.7),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fillColor: FHColor.bgTextFieldColor,
                            hintStyle: AppTheme.hintTextStyle,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            hintText: "Verification Code",
                            errorText: null,
                            counterText: "",
                            errorStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      // visible: isMobileNumberEntered,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            // foregroundColor: isMobileNumberEntered?FHColor.appColor:Colors.white54,
                            backgroundColor: isMobileNumberEntered
                                ? FHColor.appColor
                                : Colors
                                    .white54, // Text Color (Foreground color)
                            side: BorderSide(
                                width: 0,
                                color: isMobileNumberEntered
                                    ? FHColor.appColor
                                    : Colors.white54), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(15)),
                        onPressed: () {
                          // Perform login or verification logic here
                          CacheServiceImp().setLogin(false);
                          loginUser(context);
                        },
                        child: Text('Continue',
                            style:
                                TextStyle(fontSize: 22, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future loginUser(context) async {
    final mapData = {
      "phone": mobileNumberController.text,
    };

    final response = await http.post(
      Uri.parse('http://172.105.60.113/fithouse/fithouse/api/login.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(mapData),
    );

    print(mapData);
    // print(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // var data = await json.decode(response.toString());
      String jsonsDataString = response.body.toString(); //
      var data = jsonDecode(jsonsDataString);
      print("frvr-->" + jsonsDataString);

      if (data["status"] == true) {
        Navigator.pushNamed(context, RouteGenerator.afterLogin);
        CSnackBar.successSnackBar(context, data["message"]);
      } else {
        CSnackBar.errorSnackBar(context, data["message"]);
      }
      print(data["status"]);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
    // _Database = await openDB();
    // // UserRepo userRepo = new UserRepo();
    // // userRepo.createtable(_Database);
    //
    // UserModel userModel = new UserModel(fullNameController.text.toString(),emailCodeController.text.toString(),int.tryParse(mobileNumberController.text.toString())!);
    // await _Database?.insert("users",userModel.toMap());
    // await _Database?.close();
  }
}
