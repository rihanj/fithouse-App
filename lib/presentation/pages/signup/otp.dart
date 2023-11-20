import 'dart:convert';
import 'package:fithouse_app/utils/App_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../../../data/model/user_details_model.dart';
import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/c-snack_bar.dart';
import '../../widgets/f_h_themes.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FHColor.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: ()=>Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: FHColor.appColor,
            size: 24,
          ),
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
                          maxLength: 6,
                          decoration: InputDecoration(
                              // labelText: 'OTP',
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: FHColor.appColor, width: 1.7),
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
                          child:
                          loader?
                          Center(child: CircularProgressIndicator(color: FHColor.whiteColor,),):
                          Text('Validate',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement your resend OTP logic here
                            // You can send a new OTP and update the UI accordingly
                            resend_otp();
                          },
                          child: Text(
                            'Resend OTP',
                            style: TextStyle(
                              color: Colors.black,
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
    setState(() {
      loader = true;
    });
    print("Validate otp function called");
    final LocalStorage storage = await LocalStorage('Signup-otp');
    // print("Signup otp----->>> ${storage.getItem('Signup_otp')}");
    var jsondata = storage.getItem('Signup_otp');
    var send_otp ="123456";
    var otp = otpController.text.toString();
    if (send_otp == otp) {
      final LocalStorage signupdata = await LocalStorage('Signup_data');

      print("Signup data----->>> ${storage.getItem('Signup_data')}");

      var signUp = AppData.signUpData;
      // print("Signup data----->>>signUp" + signUp);

      var name = signUp['name'];
      var phone = signUp['phone'];
      var email = signUp['email'];

      print("name" + name);
      final mapData = {'name': name.trim(), 'phone': phone, 'email': email};

      final response = await http.post(
        Uri.parse('http://172.105.60.113/fithouse/fithouse/api/signup.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(mapData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        String jsonsDataString = response.body.toString(); //
        var data = jsonDecode(jsonsDataString);
        print("sign up data---->>>>>>>>>>> "+data.toString());
        UserDetailsModel userDetailsModel =  UserDetailsModel.fromJson(data);
        AppData.userDetails =  userDetailsModel;
        AppData.id = data["id"]??"";

        setState(() {
          loader = false;
        });
        if (data["status"] == true) {
          Navigator.pushNamed(context, RouteGenerator.deliveryRoute);
          CSnackBar.successSnackBar(context, data["message"]);
        } else {
          CSnackBar.errorSnackBar(context, data["message"]);
        }
      }

    } else {
      setState(() {
        loader = false;
      });
      CSnackBar.errorSnackBar(context, "Incorrect OTP");
    }
  }

  Future resend_otp() async {
    var signUp = AppData.signUpData;
    var phone = signUp['phone'];
    final mapData = {
      'userName': "n.elsaber@emc.sa",
      'numbers': phone,
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
    if (response.statusCode == 200 || response.statusCode == 201) {
      // var data = await json.decode(response.toString());
      var otp_data = {"otp": "123456"};
      final LocalStorage storage = await LocalStorage('Signup-otp');
      storage.setItem('Signup_otp', otp_data);
      print("Signup otp----->>> ${storage.getItem('Signup_otp')}");

      String jsonsDataString = response.body.toString(); //
      var data = jsonDecode(jsonsDataString);
      print(data);
      // if (data["status"] == true) {
      Navigator.pushNamed(context, RouteGenerator.aftersignup);
      //   CSnackBar.successSnackBar(context, data["message"]);
      // } else {
      //   CSnackBar.errorSnackBar(context, data["message"]);
      // }
      // print(data["status"]);
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
