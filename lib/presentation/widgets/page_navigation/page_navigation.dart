import 'package:flutter/material.dart';

extension PageNavigation on PageRouteBuilder{

  static PageRouteBuilder push(Widget child,bool isLTR){
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
        // var begin = isLTR ? Offset(1.0, 0.0):Offset(0.0, 1.0);
        // const end = Offset.zero;
        // const curve = Curves.easeIn;
        // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //
        // return SlideTransition(
        //   position: animation.drive(tween),
        //   child: child,
        // );
      },
    );
  }

}