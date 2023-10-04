import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../themes/f_h_colors.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    primaryColor: FHColor.primaryColor,
    primaryColorDark: FHColor.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: "Roboto",
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: const Color(0xff02a3f7)),
  );

  static TextStyle textH2 = TextStyle(
      fontSize: getFont(30),
      color: FHColor.whiteColor,
      fontFamily: "Roboto Condensed",
      fontWeight: FontWeight.w800
  );
  static TextStyle textH3 = TextStyle(
      fontSize: getFont(18),
      fontFamily: "Roboto",
      fontWeight: FontWeight.w600
  );


  static TextStyle hintTextStyle = TextStyle(
      color: FHColor.whiteColor,
      fontFamily: "Roboto",
      fontSize: getFont(14),
      fontWeight: FontWeight.normal
  );

  static TextStyle captionTextStyle(bool isLight){
    return TextStyle(
        color: isLight? FHColor.accentColor: FHColor.textColor,
        fontFamily: "Roboto",
        fontSize: getFont(12),
        fontWeight: FontWeight.normal
    );
  }
  static TextStyle captionLightTextStyle = TextStyle(
      color: FHColor.accentColor.withOpacity(0.7),
      fontFamily: "Roboto",
      fontSize: getFont(12),
      fontWeight: FontWeight.normal
  );

  // --------- New Updates Theme --------
  static TextStyle fPJBold(double fontSize,bool isLight){
    return TextStyle(
        fontSize: getFont(fontSize),
        letterSpacing: 0.3,
        fontFamily: 'Plus Jakarta Sans',
        fontWeight: FontWeight.w800,
        color: isLight? FHColor.bgColor :Colors.black87
    );
  }

  static TextStyle fPJRegular(double fontSize,bool isLight){
    return TextStyle(
        fontSize: getFont(fontSize),
        letterSpacing: 0.3,
        fontFamily: 'Plus Jakarta Sans',
        fontWeight: FontWeight.w500,
        color: isLight? FHColor.bgColor :Colors.black87
    );
  }

  static TextStyle fCPJRegular(double fontSize,Color color){
    return TextStyle(
        fontSize: getFont(fontSize),
        letterSpacing: 0.3,
        fontFamily: 'Plus Jakarta Sans',
        fontWeight: FontWeight.w500,
        color: color
    );
  }
  static TextStyle fCPJBold(double fontSize,Color color){
    return TextStyle(
        fontSize: getFont(fontSize),
        letterSpacing: 0.3,
        fontFamily: 'Plus Jakarta Sans',
        fontWeight: FontWeight.w800,
        color: color
    );
  }
}