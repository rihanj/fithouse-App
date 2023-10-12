import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../utils/App_data.dart';
import '../../../../utils/route_generator.dart';
import '../../../widgets/c-snack_bar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  bool observeText = true;
  bool isMobileNumberEntered = false;
  bool disableButton = false;
  bool isButtonEnabled = false;
  bool isLoading = false;

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();

  bool isTimerRunning = false;
  int secondsRemaining = 60;
  Timer? _timer;

  void startTimer() {
    isTimerRunning = true;
    secondsRemaining = 60;
    isButtonEnabled = false;
    String buttonText = 'Resend OTP $secondsRemaining';

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      secondsRemaining--;

      if (secondsRemaining <= 0) {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    isTimerRunning = false;
    String buttonText = 'Resend OTP';
    isButtonEnabled = true;

    if (_timer != null) {
      _timer!.cancel();
    }
  }

  LoginCubit() : super(LoginInitial());

  Future send_otp(context) async {
    emit(LoadingOp());
    print("send otp function");

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
      startTimer();

      isLoading = false;

      var otp_data = {"otp": "123456"};
      final LocalStorage storage = await LocalStorage('Login-otp');
      storage.setItem('Login_otp', otp_data);
      String jsonsDataString = response.body.toString(); //
      var data = jsonDecode(jsonsDataString);
      CSnackBar.successSnackBar(context, "OTP Send Successfully");
      emit(RefreshState());
    }
  }

  Future loginUser(context) async {
    isLoading = true;
    emit(LoadingOp());
    print(isLoading);
    print("Login user function");
    var code = verificationCodeController.text;
    print(code);
    final LocalStorage storage = await LocalStorage('Login-otp');
    var SendOtp = storage.getItem('Login_otp');
    print(SendOtp['otp']);
    if (code == SendOtp['otp']) {
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
        String jsonsDataString = response.body.toString(); //
        var data1 = jsonDecode(jsonsDataString);
        print("frvr-->" + jsonsDataString);
        isLoading = false;
        if (data1["status"] == true) {
          final LocalStorage storage = LocalStorage('user-info');
          storage.setItem('info', jsonsDataString);
          var data = await jsonDecode(storage.getItem('info'))!;
          // var userInfo = await storage.getItem('user-info');
          // var userInfo1 = json.decode(userInfo);

          AppData.sub_id = data1['subscripton'];
          AppData.username = data["full_name"];
          Navigator.pushNamed(context, RouteGenerator.bottomBar);
          CSnackBar.successSnackBar(context, data["message"]);
        } else {
          CSnackBar.errorSnackBar(context, data1["message"]);
          emit(RefreshState());
        }
        emit(RefreshState());
      }
    } else {
      CSnackBar.errorSnackBar(context, "Incorrect OTP");
      emit(RefreshState());
    }

    //   // _Database = await openDB();
    //   // // UserRepo userRepo = new UserRepo();
    //   // // userRepo.createtable(_Database);
    //   //
    //   // UserModel userModel = new UserModel(fullNameController.text.toString(),emailCodeController.text.toString(),int.tryParse(mobileNumberController.text.toString())!);
    //   // await _Database?.insert("users",userModel.toMap());
    //   // await _Database?.close();
    // }
  }

  buttonDisable(value) {
    disableButton = value != null ? true : false;
    emit(RefreshState());
  }
}
