
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shapes{

  static Widget container({
    BorderRadiusGeometry? borderRadius,
    Color? bgColor,
    BoxBorder? border,
    double? height,
    double? width,
    Function? onTap,
    double? shadowValue,
    EdgeInsetsGeometry? margin,
    bool isShadow = false,
    EdgeInsetsGeometry? padding,
    DecorationImage? bgImage,
    required Widget child
  }){
    padding ??= const EdgeInsets.all(8);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: (){
        if(onTap!=null){
          onTap();
        }
      },
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
         image: bgImage,
            borderRadius: borderRadius,
            color: bgColor,
            border: border,
            boxShadow:isShadow? [
              BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey.shade300,
                  spreadRadius: shadowValue??3
              )
            ]:[]
        ),
        child: Padding(
          padding:  padding,
          child: child,
        ),
      ),
    );
  }

}