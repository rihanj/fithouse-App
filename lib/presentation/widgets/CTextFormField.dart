import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final IconData? prefixIcon;
  final String hint;
  final String? hintText;
  final String? error;
  final int? maxLength;
  final TextInputType? inputType;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final Widget? suffix;
  final bool observeText;
  bool? enable = true;
  final bool isLight;
  final int? maxLines;
  final TextStyle? textStyle;
  final FormFieldValidator<String>? validator;
  TextInputAction? textInputAction;
  TextCapitalization? textCapitalization;

  CTextField({
    this.controller,
    this.onChanged,
    this.prefixIcon,
    required this.hint,
    this.error,
    this.inputType = TextInputType.text,
    this.maxLength,
    this.suffixIcon,
    this.suffixIconColor,
    this.validator,
    this.suffix,
    this.enable,
    this.observeText = false,
    this.isLight = false,
    this.maxLines,
    this.hintText,
    this.textStyle,
    this.textCapitalization,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextFormField(
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        controller: controller,
        textAlign: TextAlign.start,
        style: textStyle,
        keyboardType: inputType,
        maxLength: maxLength,
        obscureText: observeText,
        validator: validator,
        onChanged: onChanged,
        textInputAction: textInputAction,
        enabled: enable,
        maxLines: maxLines,
        decoration: InputDecoration(
            filled: true,
            prefixIcon: prefixIcon != null
                ? Icon(
              prefixIcon,
            )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.2),
              borderRadius: BorderRadius.circular(14.0),
            ),
            suffixIcon: suffixIcon != null
                ? Icon(
              suffixIcon,

            )
                : null,
            fillColor: Colors.transparent,
            //hintStyle: AppTheme.hintTextStyle,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            label: Text(
              hint,
              style:
             TextStyle(color: Colors.grey),
            ),
            errorText: error,
            hintText: hintText ?? "",
            // hintStyle: ThemeConfig.lightText.labelSmall,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: suffix,
            counterText: "",
            //  labelStyle: AppTextTheme.fCInterRegular(16,Colors.grey),
            errorStyle: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold)),
      ),
    );
  }
}