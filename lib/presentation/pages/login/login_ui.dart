import 'package:fithouse_app/data/data_provider/cache_service_imp.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../utils/route_generator.dart';
import '../../widgets/f_h_back_app_bar.dart';
import '../../widgets/f_h_themes.dart';
import 'package:lottie/lottie.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
            margin: const EdgeInsets.only(left: 20.00,top: 120.00,right: 0.0,bottom:0.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Log in'.toUpperCase(),
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
                        Navigator.pushNamed(context, RouteGenerator.loginRoute);
                      },
                  ),
                  TextSpan(
                    text: '  Sign up'.toUpperCase(),
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
                        Navigator.pushNamed(context, RouteGenerator.signupRoute);
                      },
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20.0,top:240.0,right: 20.0,bottom: 20.0),
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
                        padding: const EdgeInsets.all(10.0),
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
                      ),
                      Visibility(
                        visible: isMobileNumberEntered,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                              hintText: "Verification Code",
                              errorText: null,
                              counterText: "",
                              errorStyle:
                              TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Visibility(
                        // visible: isMobileNumberEntered,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // foregroundColor: isMobileNumberEntered?FHColor.appColor:Colors.white54,
                              backgroundColor:isMobileNumberEntered?FHColor.appColor:Colors.white54, // Text Color (Foreground color)
                              side: BorderSide(width:0, color:isMobileNumberEntered?FHColor.appColor:Colors.white54), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(15)
                          ),
                          onPressed: () {
                            // Perform login or verification logic here
                            CacheServiceImp().setLogin(false);
                          },
                          child: Text('Continue',style: TextStyle(fontSize: 22,color:Colors.white)),
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
}
