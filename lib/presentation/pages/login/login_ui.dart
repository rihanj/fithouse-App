import 'package:fithouse_app/presentation/pages/login/cubit/login_cubit.dart';
import 'package:fithouse_app/presentation/themes/dimens.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import '../../../utils/route_generator.dart';
import '../../../utils/validator.dart';
import '../../widgets/c-snack_bar.dart';
import '../../widgets/f_h_themes.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.watch<LoginCubit>();
    return Scaffold(
      backgroundColor: FHColor.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          color: FHColor.appColor,
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
                padding: const EdgeInsets.only(right: 12.0),
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
                left: 20.00, top: 120.00, right: 0.0, bottom: 0.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text:  S.current.login.toUpperCase(),
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
                    text: '  ${S.current.signUpString.toUpperCase()}',
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
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is SendOtp) {
                    CSnackBar.successSnackBar(context, "OTP Send Successfully");
                  } else if (state is SuccessOtp) {
                    CSnackBar.successSnackBar(
                        context, state.data.message.toString());
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteGenerator.bottomBar, (Route<dynamic> route) => false);
                  } else if (state is ErrorIncorrectOtp) {
                    CSnackBar.errorSnackBar(context, "Incorrect Otp");
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.00),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                           Padding(
                            padding: EdgeInsets.all(10.0),
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
                          Visibility(
                            // visible: isMobileNumberEntered,
                            child: Form(
                              key: _formKey,
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
                                      borderSide: const BorderSide(
                                          color: FHColor.appColor, width: 1.7),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    fillColor: FHColor.bgTextFieldColor,
                                    hintStyle: AppTheme.hintTextStyle2,
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    hintText: S.current.PhoneHintString,

                                    // errorText: "null",
                                    counterText: "",
                                    errorStyle: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                                validator: (val) {
                                  if (!Validator.validatePhoneNumber(
                                      val!.number)) {
                                    print(
                                        "valid ${Validator.validatePhoneNumber(val.number)}");
                                    return S.current.inValidatePhone;
                                  }
                                },
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
                          ),
                          Visibility(
                            visible: cubit.isMobileNumberEntered,
                            child:  Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                height: 20,
                                child: Text(
                                  S.current.verificationCode,
                                  style: const TextStyle(
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
                                    borderSide: const BorderSide(
                                        color: FHColor.appColor, width: 1.7),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  fillColor: FHColor.bgTextFieldColor,
                                  hintStyle: AppTheme.hintTextStyle2,
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  hintText: S.current.verificationCode,
                                  errorText: null,
                                  counterText: "",
                                  errorStyle: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                  // CacheServiceImp().setLogin(false);
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    if (!Validator.validatePhoneNumber(
                                        cubit.mobileNumberController.text)) {
                                      CSnackBar.errorSnackBar(context,
                                          S.current.validatePhone);
                                    } else {
                                      cubit.isMobileNumberEntered
                                          ? cubit.loginUser(context)
                                          : cubit.send_otp(context);
                                    }
                                  } else {
                                    CSnackBar.errorSnackBar(context,
                                        S.current.validatePhone);
                                  }
                                },
                                child: BlocBuilder<LoginCubit, LoginState>(
                                    builder: (context, state) {

                                  return cubit.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.white),
                                        )
                                      : Text(
                                          cubit.isMobileNumberEntered
                                              ? S.current.ContinueString
                                              : S.current.SendCode,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.white));
                                })),
                          ),
                          Dimens.height(10),
                          cubit.isTimerFinished
                              ? TextButton(
                                  onPressed: () => cubit.send_otp(context),
                                  child: Text(S.current.resendCode,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: cubit.isMobileNumberEntered
                                              ? Colors.grey
                                              : Colors.white)))
                              : Center(
                                  child: Text(
                                      '${S.current.CounterResendCode} 00 : ${context.read<LoginCubit>().timerCount}  ',
                                      style: TextStyle(
                                          color: cubit.isMobileNumberEntered
                                              ? Colors.grey
                                              : Colors.white)),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
