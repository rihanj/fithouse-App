import 'package:flutter/cupertino.dart';

class SizeConfig{
  static double width = 0;
  static double height = 0;
  static var _mediaQueryData;
  static var blockSizeHorizontal;
  static var blockSizeVertical;
  static var _safeAreaHorizontal;
  static var _safeAreaVertical;
  static var safeBlockHorizontal;
  static var safeBlockVertical;
  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    Size size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;
    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (width - _safeAreaHorizontal) / 100;
    safeBlockVertical = (height - _safeAreaVertical) / 100;
  }
}

double getFont(double size) {
  double defaultsSize = SizeConfig.safeBlockHorizontal * size;
  return defaultsSize/3.5;
}

// Get the proportionate height as per screen size
double getHeight(double inputHeight) {
  double screenHeight = SizeConfig.height;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate width as per screen size
double getWidth(double inputWidth) {
  double screenWidth = SizeConfig.width;
  // 375 is the layout width that Figma provides
  return (inputWidth / 375.0) * screenWidth;
}
double getIcon(double size) {
  double defaultsSize = SizeConfig.safeBlockHorizontal * size;
  return defaultsSize/3.5;
}