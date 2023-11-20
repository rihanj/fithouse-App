import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class STextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final int? maxLines;
  final bool? enable;

  const STextFormField({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
    this.enable = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusBorder!),
            borderSide: BorderSide(color: colorBoder!, width: 1)) ,
          fillColor: colorFill,
          contentPadding: padding,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          hintText: hintText,
          hintStyle: textStyle!.apply(color: colorHint)),
      style: textStyle!,
    );
  }
}
class DropdownButtonCustom extends StatelessWidget {
  //final Function(String)? onChanged;
  ValueChanged<String?>? onChanged;
  final double? width;
  final double? height;
  final List? list;
  final EdgeInsets? padding;
  final Color? colorIcon;
  final IconData? icon;
  final TextStyle? textStyle;
  final TextStyle? titleStyle;
  final String? hintText;
  final String? title;
  final String? dropdownValue;
  final Color? bgColor;
  final BoxBorder?border;

  DropdownButtonCustom(
      {Key? key,
        this.onChanged,
        this.width = 150,
        this.height = 50,
        this.list = const ['One', 'Two', 'Three'],
        this.padding = const EdgeInsets.all(0),
        this.colorIcon = Colors.red,
        this.textStyle = const TextStyle(color: Colors.black),
        this.hintText = 'Type your hint text here',
        this.icon = Icons.add,
        this.titleStyle = const TextStyle(color: Colors.green),
        this.bgColor = Colors.white,
        this.title = 'Title',
        this.dropdownValue,this.border })
      : super(key: key);

  // String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width,
      height: height,
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.0),
        border:
        border

      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(
          //   icon,
          //   color: FHColor.blackColor,
          //   size: 26,
          // ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   widget.title.toString(),
                //   style: widget.titleStyle!.apply(color: Colors.pink),
                // ),
                Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      // icon: Container(
                      //   margin: const EdgeInsets.only(bottom: 20),
                      //   child: Icon(
                      //     Icons.expand_more,
                      //     size: 25,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      // iconSize: 0,
                      value: dropdownValue,

                      elevation: 16,
                      style: textStyle,
                      hint: Text(
                        hintText!,
                        style: textStyle!,
                        textAlign: TextAlign.center,
                      ),
                      underline: Container(
                        height: 0,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: onChanged!,
                      items: list!
                          .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                          style: textStyle!,
                        ),
                      ))
                          .toList(),
                    )),
              ],
            ),
          ),
          // Icon(
          //   Icons.expand_more,
          //   size: 25,
          //   color: widget.colorIcon,
          // ),
        ],
      ),
    );
  }
}