import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_score/themes/colors.dart';

class LightTheme {
  static ThemeData of(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        fontFamily: defaultFontFamily,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: lightThemeIconColor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: lightThemeStatusColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: lightThemeBackgroundColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: lightThemeTextColor,
            fontFamily: defaultFontFamily,
            fontSize: appBarFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: lightThemeBackgroundColor,
        primarySwatch: defaultColor,
        textTheme: TextTheme(
          subtitle1: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: lightThemeTextColor,
                fontFamily: defaultFontFamily,
              ),
          bodyText2: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: defaultFontFamily,
                color: lightThemeTextColor,
              ),
          bodyText1: const TextStyle(
            fontFamily: defaultFontFamily,
            color: lightThemeTextColor,
            fontSize: bodyText1FontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: defaultColor,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: defaultColor,
          elevation: 20,
          type: BottomNavigationBarType.fixed,
        ),
      );
}
