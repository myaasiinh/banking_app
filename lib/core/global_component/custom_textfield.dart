import 'package:flutter/material.dart';

class CTextInput extends StatelessWidget {
  const CTextInput({
    super.key,
    required this.textController,
    this.labelInput,
    this.suffixIcon,
    this.obscureText = false,
    this.isError = false,
    this.errorMsg = "Error",
    this.onTyping,
    this.borderRadius = 10.0,
    this.borderWidth = 2.0,
    this.hintText,
    this.width = 16.0,
    this.height = 8.0,
    this.filled = true,
    this.inputBackgroundColors,
    this.enableBorderColors,
    this.errorBorderColors,
    this.focusBorderColors,
    this.floatingLabelBehavior,
    this.enableInput = true,
    this.preffixIcon,
    this.cursorColors,
    this.keyboardType,
    this.prefixText,
    this.focusNode,
    this.focusNodeButtonColors,
    this.maxLength,
    this.maxLines,
  });

  final TextEditingController textController;
  final String? labelInput;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final String? prefixText;
  final bool obscureText;
  final bool isError;
  final String errorMsg;
  final Function(String)? onTyping;
  final double borderRadius;
  final double borderWidth;
  final String? hintText;
  final double width;
  final double height;
  final bool filled;
  final bool enableInput;
  final Color? enableBorderColors;
  final Color? errorBorderColors;
  final Color? focusBorderColors;
  final Color? inputBackgroundColors;
  final Color? cursorColors;
  final Color? focusNodeButtonColors;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      cursorColor: cursorColors,
      controller: textController,
      obscureText: obscureText,
      onChanged: onTyping,
      enabled: enableInput,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: inputBackgroundColors,
        filled: filled,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: enableBorderColors ?? Colors.grey,
            width: borderWidth,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        errorText: isError ? errorMsg : null,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: errorBorderColors ?? Colors.red,
            width: borderWidth,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: errorBorderColors ?? Colors.red,
            width: borderWidth,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: preffixIcon,
        prefixText: prefixText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: focusBorderColors ?? Colors.blue,
            width: borderWidth,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: focusBorderColors ?? Colors.blue,
            width: borderWidth,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: width, vertical: height),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey.withOpacity(0.3),
        ),
        floatingLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: isError
                ? Colors.red
                : Colors.black),
        label: Text(
          labelInput ?? "",
        ),
        floatingLabelBehavior: floatingLabelBehavior,
      ),
    );
  }
}
