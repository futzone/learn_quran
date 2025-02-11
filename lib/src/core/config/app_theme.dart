import 'package:flutter/material.dart';
import 'package:learn_quran/main.dart';

class AppColors {
  final bool isDark;

  AppColors({required this.isDark});

  Color get mainColor => const Color(0xFF006FFF);

  Color get secondaryColor => const Color(0xFF0463CA);

  Color get accentColor => isDark ? const Color(0xFF1E2428) : const Color(0xFFD8E9F8);

  Color get highlightColor => const Color(0xFF65C2F5);

  Color get actionColor => const Color(0xFF09B1EC);

  Color get textColor => isDark ? Colors.white : Colors.black;

  Color get secondaryTextColor => isDark ? const Color(0xffababab) : const Color(0xff595959);

  Color get appBarColor => isDark ? scaffoldBgColor : Colors.white;

  Color get appBarTextColor => isDark ? Colors.white : mainColor;

  Color get appBarIconColor => isDark ? Colors.white : Colors.black;

  Color get scaffoldBgColor => isDark ? const Color(0xFF121212) : Color(0xffe5e7eb);

  Color get cardColor => isDark ? const Color(0xFF1E1E1E) : Colors.white;

  Color get dividerColor => isDark ? Colors.grey[700]! : Colors.grey[300]!;

  Color get buttonColor => isDark ? actionColor : secondaryColor;

  Color get iconColor => isDark ? Colors.white : Colors.black;

  ThemeData get themeData => ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primaryColor: mainColor,
        scaffoldBackgroundColor: scaffoldBgColor,
        appBarTheme: AppBarTheme(
          elevation: 20,
          scrolledUnderElevation: 10,
          surfaceTintColor: Colors.transparent,
          backgroundColor: appBarColor,
          titleTextStyle: TextStyle(
            color: appBarTextColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        cardColor: cardColor,
        dividerColor: dividerColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: textColor,
          ),
        ),
        iconTheme: IconThemeData(color: iconColor),
        textTheme: TextTheme(
            // bodyLarge: TextStyle(color: textColor, fontFamily: "Extra-Bold"),
            // bodyMedium: TextStyle(color: textColor, fontFamily: "Medium"),
            // bodySmall: TextStyle(color: textColor, fontFamily: "Regular"),
            ),
      );

  get green => Colors.greenAccent;

  get red => Colors.redAccent;

  get amber => Colors.amber;

  get purple => Colors.purple;

  Color get yellow => Colors.yellow;

  Color get orange => Colors.orange;

  Color get pink => Colors.pink;
}
