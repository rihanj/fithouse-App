// import 'dart:js_util';

import 'package:fithouse_app/data/local/databasehelper.dart';
import 'package:fithouse_app/data/model/user_model.dart';
import 'package:fithouse_app/data/repository/user_repo.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../../../data/model/user_details_model.dart';
import '../../../generated/l10n.dart';
import '../../../utils/App_data.dart';
import '../../../utils/route_generator.dart';
import '../../widgets/c-snack_bar.dart';
import '../../widgets/f_h_back_app_bar.dart';
import '../../widgets/f_h_themes.dart';
import 'package:lottie/lottie.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class SignupUI extends StatefulWidget {
  const SignupUI({Key? key}) : super(key: key);

  @override
  State<SignupUI> createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailCodeController = TextEditingController();
  Database? _Database;
  bool isMobileNumberEntered = false;
  var formKey = GlobalKey<FormState>();

  // bool isEmail(String input) => EmailValidator.validate(input);
  // bool isPhone(String input) => RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
  //         .hasMatch(input);
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
               Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Text(
                  S.current.appBarHelp,
                  style: const TextStyle(
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
                    text: S.current.loginString.toUpperCase(),
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
                        Navigator.pushNamed(context, RouteGenerator.loginRoute);
                      },
                  ),
                  TextSpan(
                    text: '  ${S.current.signUpString}'.toUpperCase(),
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
                boxShadow: const [
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
                              S.current.signUpFullName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: fullNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              // labelText: 'Full Name',
                              filled: true,
                              prefixIcon: Icon(Icons.account_circle_sharp),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: FHColor.appColor, width: 1.7),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: FHColor.bgTextFieldColor,
                              hintStyle: AppTheme.hintTextStyle2,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: S.current.signUpFullName,
                              errorText: null,
                              counterText: "",
                              errorStyle: const TextStyle(
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
                              S.current.PhoneNumberString,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        IntlPhoneField(
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
                                    color: FHColor.appColor, width: 1.7),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fillColor: FHColor.bgTextFieldColor,
                              hintStyle: AppTheme.hintTextStyle2,
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
                              hintText: S.current.PhoneHintString,
                              errorText: null,
                              counterText: "",
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          // validator: (v) {
                          //   if (v?.completeNumber != null) {
                          //     return null;
                          //   } else {
                          //     return "Please Enter a Valid Number";
                          //   }
                          // },
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
                         Padding(
                          padding: EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              S.current.signUpEmail,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: emailCodeController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              // labelText: 'Email',
                              filled: true,
                              prefixIcon: Icon(Icons.email_outlined),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: FHColor.appColor, width: 1.7),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: FHColor.bgTextFieldColor,
                              hintStyle: AppTheme.hintTextStyle2,
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
                              hintText: S.current.signUpEmailHint,
                              errorText: null,
                              counterText: "",
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          validator: (v) {
                            if (v == null) {
                              return S.current.validateEmail;
                            } else if (v.isEmpty) {
                              return S.current.validateEmail;
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
                            // Perform Signup logic here
                            if (formKey.currentState!.validate()) {
                              await insertUser(context);
                            }

                            print("button clicked");
                            // getUser();
                          },
                          child: Text(S.current.ContinueString,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              S.current.termsCondition,
                              style: const TextStyle(
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


  //insert user in user table
  Future insertUser(context) async {
    final mapData = {
      'name': fullNameController.text.toString().trim(),
      'phone': mobileNumberController.text.toString(),
      'email': emailCodeController.text.toString(),
    };
    final LocalStorage storage = LocalStorage('user-info');
    storage.setItem('Signup_data', mapData);

    print("after store the data----->>> ${storage.getItem('Signup_data')}");
    AppData.signUpData = storage.getItem('Signup_data');
    UserDetailsModel userDetailsModel =  UserDetailsModel.fromJson(mapData);
    AppData.userDetails =  userDetailsModel;
    print("app data----->>> ${storage.getItem('Signup_data')}");
    var setList = await OtpVaidate();
    // final response = await http.post(
    //   Uri.parse('http://172.105.60.113/fithouse/fithouse/api/signup.php'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(mapData),
    // );
    //
    // print(mapData);
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
    // }
    // else {
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

  Future OtpVaidate() async {
    // print("otp validate function");
    final mapData = {
      'userName': "n.elsaber@emc.sa",
      'numbers': mobileNumberController.text.toString(),
      'userSender': "Boxing",
      "apiKey": "4814ce8181d8ca9e112a4f1a1b222158",
      "msg": "Signup Otp"
    };

    final response = await http.post(
      Uri.parse('https://www.msegat.com/gw/sendsms.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(mapData),
    );

    print(mapData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // var data = await json.decode(response.toString());
      var otp_data = {"otp": "123456"};
      final LocalStorage storage = await LocalStorage('Signup-otp');
      storage.setItem('Signup_otp', otp_data);
      print("Signup otp----->>> ${storage.getItem('Signup_otp')}");

      String jsonsDataString = response.body.toString(); //
      var data = jsonDecode(jsonsDataString);
      print(data);
      Navigator.pushNamed(context, RouteGenerator.aftersignup);

    } else {
      throw Exception('Failed to create album.');
    }
  }

}
