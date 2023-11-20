import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fithouse_app/config/js_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../data/data_provider/cache_service_imp.dart';
import '../../../../data/model/user_details_model.dart';
import '../../../../data/repository/login_repo.dart';
import '../../../../domain/repositories/login_repo.dart';
import '../../../../utils/App_data.dart';
import '../../../../utils/route_generator.dart';
import '../../../widgets/c-snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  bool observeText = true;
  bool isMobileNumberEntered = false;
  bool disableButton = false;
  bool isButtonEnabled = false;
  bool isLoading = false;
  int timerCount = 60;
  bool isTimerFinished = false;

  countDownTimer() async {
    timerCount = 60;
    isTimerFinished = false;
    for (int x = 60; x > 0; x--) {
      await Future.delayed(Duration(seconds: 1)).then((_) {
        if (timerCount == 1) isTimerFinished = true;

        timerCount -= 1;
      });
      emit(RefCounterState());
    }
  }

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();

  LoginCubit() : super(LoginInitial());

  Future send_otp(context) async {
    emit(LoadingOp());
    isLoading = true;
    print(isLoading);
    var phone = mobileNumberController.text;
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
      print("Inside if");
      // startTimer();
      countDownTimer();
      isLoading = false;
      isMobileNumberEntered = true;
      var otp_data = {"otp": "123456"};
      final LocalStorage storage = await LocalStorage('Login-otp');
      storage.setItem('Login_otp', otp_data);
      String jsonsDataString = response.body.toString(); //
      var data = jsonDecode(jsonsDataString);

      emit(SendOtp());
    }
  }

  Future loginUser(context) async {
    ILoginRepo services = LoginRepoImp();
    isLoading = true;
    emit(LoadingOp());
    try {
      print("Login user function");
      var code = verificationCodeController.text;
      print(code);
      final LocalStorage storage = await LocalStorage('Login-otp');
      var SendOtp = await storage.getItem('Login_otp');
      // print(SendOtp['otp']);
      if (code == "123456"
          // SendOtp['otp']
          ) {
        final mapData = {
          "phone": mobileNumberController.text,
        };
        var d = await services.getUser(mapData);

        print("data is here--->>>"+d.toString());
        UserDetailsModel response = d;

        JSLog.tagInfo(tag: "login data", msg: response.toString());

        if (response != null) {
          isLoading = false;
          CacheServiceImp().setLogin(true);
          // AppData.sub_id = response.subscripton!;
          AppData.subscriptionStatus = response.subscriptionStatus.toString();

          // AppData.username = response.fullName.toString();
          emit(SuccessOtp(response));
        } else {
          isLoading = false;
          emit(ErrorIncorrectOtp());
        }
      }
    } catch (e) {
      isLoading = false;
      JSLog.error(msg: e);
    }
  }

  buttonDisable(value) {
    disableButton = value != null ? true : false;
    emit(RefreshState());
  }
}
