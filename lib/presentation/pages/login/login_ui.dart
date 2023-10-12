import 'dart:async';
import 'dart:convert';

import 'package:fithouse_app/data/data_provider/cache_service_imp.dart';
import 'package:fithouse_app/presentation/pages/login/cubit/login_cubit.dart';
import 'package:fithouse_app/presentation/pages/signup/confirm_location.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/App_data.dart';
import '../../../utils/route_generator.dart';
import '../../widgets/c-snack_bar.dart';
import '../../widgets/f_h_back_app_bar.dart';
import '../../widgets/f_h_themes.dart';
import 'package:lottie/lottie.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool isButtonEnabled = false;

  bool isTimerRunning = false;
  int secondsRemaining = 60;
  Timer? _timer;

  void startTimer() {
    setState(() {
      isTimerRunning = true;
      secondsRemaining = 60;
      isButtonEnabled = false;
      String buttonText = 'Resend OTP $secondsRemaining';
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        secondsRemaining--;
      });

      if (secondsRemaining <= 0) {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    setState(() {
      isTimerRunning = false;
      String buttonText = 'Resend OTP';
      isButtonEnabled = true;
    });

    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  void disableButtonForOneMinute() {
    setState(() {
      isButtonEnabled = false;
    });

    Timer(Duration(minutes: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.watch<LoginCubit>();
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
                        controller: cubit.mobileNumberController,
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

                          cubit.buttonDisable(value);

                          print(cubit.disableButton);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                    ),
                    Visibility(
                      visible: cubit.isMobileNumberEntered,
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
                      visible: cubit.isMobileNumberEntered,
                      child: TextField(
                        controller: cubit.verificationCodeController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: InputDecoration(
                            // labelText: 'Verification Code',
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: FHColor.appColor, width: 1.7),
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
                              backgroundColor: cubit.disableButton
                                  ? FHColor.appColor
                                  : Colors.white54,
                              // Text Color (Foreground color)
                              side: BorderSide(
                                  width: 0,
                                  color: cubit.disableButton
                                      ? FHColor.appColor
                                      : Colors.white54),
                              //border width and color
                              elevation: 3,
                              //elevation of button
                              shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(15)),
                          onPressed: () {
                            // Perform login or verification logic here
                            CacheServiceImp().setLogin(false);

                            cubit.isMobileNumberEntered
                                ? cubit.loginUser(context)
                                : cubit.send_otp(context);

                            cubit.isMobileNumberEntered = true;
                          },
                          child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                            if (state is LoadingOp) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Text(
                                  cubit.isMobileNumberEntered
                                      ? "Continue"
                                      : 'Send OTP',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white));
                            }
                          })

                          // cubit.isLoading
                          //     ? const Center(
                          //         child: CircularProgressIndicator(),
                          //       )
                          //     : Text(
                          //         cubit.isMobileNumberEntered
                          //             ? "Continue"
                          //             : 'Send OTP',
                          //         style: TextStyle(
                          //             fontSize: 22, color: Colors.white)),
                          ),
                    ),
                    TextButton(
                      onPressed: isButtonEnabled
                          ? () {
                              cubit.send_otp(context);
                            }
                          : null,
                      child: Text(
                          cubit.isMobileNumberEntered
                              ? 'Resend OTP $secondsRemaining  seconds'
                              : "",
                          style: TextStyle(
                              color: cubit.isMobileNumberEntered
                                  ? Colors.grey
                                  : Colors.white)),
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
