import 'dart:async';

class Validator {
  Validator._();

  static const _emailRegExpString =
      r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
      r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
  static final _emailRegex = RegExp(_emailRegExpString, caseSensitive: false);

  static bool isValidPassword(String password) => password.length >= 6;

  static bool isValidEmail(String email) => _emailRegex.hasMatch(email);

  static bool isValidUserName(String userName) => userName.length >= 3;

  static bool isValidContactNo(String phoneNo) => phoneNo.length == 9;

  var contactValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (phone, sink){
        if(phone.isNotEmpty && phone != null){
          if(isValidContactNo(phone)){
            sink.add(phone);
          }else{
            sink.addError("Mobile number must be 10 digit");
          }
        }else{
          sink.addError("null");
        }
      }
  );
  static bool validatePhoneNumber(String phoneNumber) {
    // Define a regular expression for a UK phone number pattern.
    // This regex pattern allows for various formats including:
    // - +44 1234 567890
    // - 01234 567890
    // - 07700 900000
    // - 020 7946 0958
    // - and more
    RegExp ukPhoneNumberRegExp = RegExp(
        r'^(5)([0-9]{8})$');


    // RegExp ukPhoneNumberRegExp = RegExp(
    //     r'^((\+44)|(0)) ?\d{4} ?\d{6}$');

    return ukPhoneNumberRegExp.hasMatch("$phoneNumber");
  }
}
