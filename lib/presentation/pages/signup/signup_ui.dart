// import 'dart:js_util';
import 'package:fithouse_app/data/local/databasehelper.dart';
import 'package:fithouse_app/data/model/user_model.dart';
import 'package:fithouse_app/data/repository/user_repo.dart';
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
            margin: const EdgeInsets.only(left: 20.00,top: 120.00,right: 0.0,bottom:20.0),
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
                        Navigator.pushNamed(context, RouteGenerator.signupRoute);
                      },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(left: 20.0,top: 150.0,right: 20.0,bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.white, spreadRadius: 3),
                ],
              ),
              // color: Colors.white,
              child:  SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.00),
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
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            // labelText: 'Full Name',
                            filled: true,
                            prefixIcon:  Icon(Icons.account_circle_sharp),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: FHColor.bgTextFieldColor, width: 1.7),
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
                            errorStyle:
                            TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                        ),
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
                      IntlPhoneField(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                        flagsButtonPadding: const EdgeInsets.all(8),
                        dropdownIconPosition: IconPosition.trailing,
                        decoration: InputDecoration(
                          // labelText: 'Phone Number',
                            filled: true,
                            prefixIcon:  Icon(Icons.phone),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: FHColor.bgTextFieldColor, width: 1.7),
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
                            hintText: "xxxxxxxxxx",
                            errorText: null,
                            counterText: "",
                            errorStyle:
                            TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                        ),
                        initialCountryCode: 'SA',
                        onChanged: (value) {
                          print(value.completeNumber);
                          setState(() {
                            isMobileNumberEntered = value!=null ?true:false;
                          });
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.all(15.0),
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
                      TextField(
                          controller: emailCodeController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              // labelText: 'Email',
                              filled: true,
                              prefixIcon: Icon(Icons.email_outlined),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: FHColor.bgTextFieldColor, width: 1.7),
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
                              hintText: "abc@gmail.com",
                              errorText: null,
                              counterText: "",
                              errorStyle:
                              TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                          ),
                        ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:FHColor.appColor, // Text Color (Foreground color)
                              side: BorderSide(width:2, color:FHColor.appColor), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(15)
                          ),
                          onPressed: () async{
                            // Perform Signup logic here
                            var conditon = await insertUser();
                            if(conditon){
                              Navigator.pushNamed(context, RouteGenerator.deliveryRoute);
                            }else{
                              CSnackBar.errorSnackBar(context, "Phone / Email Already Exists");
                            }
                            print("button clicked");
                            // getUser();

                            // Navigator.pushNamed(context, RouteGenerator.confirmRoute);
                          },
                          child: Text('Continue',style: TextStyle(fontSize: 22,color:Colors.white)),
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
        ],
      ),
    );
  }


  //  open db & connect with database
  // Future<Database?> openDB() async {
  //   // DatabaseHelper databaseHelper = DatabaseHelper();
  //   // Database db = await databaseHelper.database;
  //    _Database = await DatabaseHelper().database;
  //    print("Anjana");print(_Database );
  //    return _Database;
  // }

  //insert user in user table
  Future<bool> insertUser() async{
    final response = await http.post(
      Uri.parse('http://172.105.60.113/fithouse/fithouse/api/signup.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': fullNameController.text.toString(),
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      var data = jsonDecode( response.body);
      print("Reached here");
      if(data["status"]){
        return true;
      }else{
        return  false;
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

  // Future<void> getUser() async{
  //   _Database = await openDB();
  //   UserRepo userRepo = new UserRepo();
  //   userRepo.getUsers(_Database);
  //   // await _Database?.close();
  // }

  // Future<void> checkLogin() async{
  //   final response = await http.get(
  //     Uri.parse('http://172.105.60.113/fithouse/fithouse/api/login.php?phone=555555555'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'title': fullNameController.text.toString(),
  //     }),
  //   );
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     // If the server did return a 201 CREATED response,
  //     // then parse the JSON.
  //     print("Reached here");
  //     print(response);
  //   } else {
  //     // If the server did not return a 201 CREATED response,
  //     // then throw an exception.
  //     throw Exception('Failed to create album.');
  //   }
  //   // _Database = await openDB();
  //   // // UserRepo userRepo = new UserRepo();
  //   // // userRepo.createtable(_Database);
  //   //
  //   // UserModel userModel = new UserModel(fullNameController.text.toString(),emailCodeController.text.toString(),int.tryParse(mobileNumberController.text.toString())!);
  //   // await _Database?.insert("users",userModel.toMap());
  //   // await _Database?.close();
  // }

}
