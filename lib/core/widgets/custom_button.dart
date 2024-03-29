import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius,
      required this.text,
       this.fontSize=18, this.onPressed});

  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final String text;
  final void Function()? onPressed;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed:onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(12))),
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: fontSize,
                color: textColor),
          )),
    );
  }
}
