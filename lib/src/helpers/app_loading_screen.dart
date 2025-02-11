 import 'package:flutter/material.dart';

import '../core/config/app_theme.dart';

class AppLoadingScreen extends StatelessWidget {
  final EdgeInsets? padding;

  const AppLoadingScreen({this.padding = EdgeInsets.zero, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SizedBox(
          height: 48,
          width: 48,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            color: AppColors(isDark: true).mainColor,
          ),
        ),
      ),
    );
  }
}
