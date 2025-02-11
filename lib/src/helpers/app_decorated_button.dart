import 'package:flutter/material.dart';
import 'package:learn_quran/src/core/config/app_theme.dart';

import 'app_simple_button.dart';

class AppPrimaryButton extends StatelessWidget {
  final AppColors theme;
  final String? title;
  final void Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double radius;
  final EdgeInsets? padding;
  final IconData? icon;

  const AppPrimaryButton({
    super.key,
    this.padding,
    this.radius = 14,
    required this.theme,
    this.title,
    required this.onPressed,
    this.color,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      onPressed: onPressed,
      child: Container(
        padding: padding ?? const EdgeInsets.only(top: 12, bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? theme.mainColor,
        ),
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  color: textColor ?? Colors.white,
                  size: 20,
                )
              : Text(
                  title ?? '',
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontFamily: 'Medium',
                  ),
                ),
        ),
      ),
    );
  }
}
