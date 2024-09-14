import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.titleButton,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.fontColor,
      this.backgroundColors,
      this.needBorder,
      this.removeElevation,
      this.preffixIcons,
      this.enableButton = true,
      this.backgroundDisableColors,
      this.buttonHeight,
      this.borderColors,
      this.borderRadius});

  final VoidCallback onPressed;
  final String titleButton;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? fontColor;
  final Color? backgroundColors;
  final Color? backgroundDisableColors;
  final bool? needBorder;
  final bool? removeElevation;
  final Widget? preffixIcons;
  final bool? enableButton;
  final double? buttonHeight;
  final double? borderRadius;
  final Color? borderColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight ?? 40,
      child: ElevatedButton(
        onPressed: enableButton ?? false ? onPressed : () {},
        style: ButtonStyle(
          backgroundColor: enableButton ?? false
              ? WidgetStateProperty.all<Color>(
                  backgroundColors ?? ColorUtils.primaryColors,
                )
              : WidgetStateProperty.all<Color>(
                  backgroundDisableColors ??
                      ColorUtils.primaryColors.withOpacity(0.2),
                ),
          elevation: removeElevation ?? false
              ? WidgetStateProperty.all<double?>(0)
              : null,
          shape: WidgetStateProperty.all<OutlinedBorder?>(
            needBorder ?? false
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    side: BorderSide(
                      color: borderColors ?? const Color(0xFF000000),
                    ),
                  )
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                  ),
          ),
        ),
        child: preffixIcons != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  preffixIcons ?? const SizedBox(),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    titleButton,
                    style: TextStyle(
                      fontSize: fontSize ?? 13,
                      fontWeight: fontWeight ?? FontWeight.w900,
                      fontStyle: fontStyle ?? FontStyle.normal,
                      color: fontColor ?? ColorUtils.titleTextColor,
                    ),
                  ),
                ],
              )
            : Text(
                titleButton,
                style: TextStyle(
                  fontSize: fontSize ?? 13,
                  fontWeight: fontWeight ?? FontWeight.w900,
                  fontStyle: fontStyle ?? FontStyle.normal,
                  color: fontColor ?? ColorUtils.titleTextColor,
                ),
              ),
      ),
    );
  }
}