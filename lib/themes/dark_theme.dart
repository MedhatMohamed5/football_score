import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_score/themes/colors.dart';
import 'package:hexcolor/hexcolor.dart';

class DarkTheme {
  static ThemeData of(BuildContext context) => ThemeData(
        fontFamily: defaultFontFamily,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: darkThemeIconColor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: HexColor('333739'),
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontFamily: defaultFontFamily,
            color: darkThemeTextColor,
            fontSize: appBarFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: darkThemeBorderColor,
            ),
          ),
        ),
        hintColor: darkThemeTextColor,
        iconTheme: const IconThemeData(color: darkThemeIconColor),
        scaffoldBackgroundColor: HexColor('333739'),
        primarySwatch: defaultColor,
        // primaryColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: defaultColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('333739'),
          selectedItemColor: defaultColor,
          unselectedItemColor: Colors.grey,
          elevation: 20,
          type: BottomNavigationBarType.fixed,
        ),
        textTheme: TextTheme(
          subtitle1: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontFamily: defaultFontFamily,
                color: darkThemeTextColor,
              ),
          bodyText2: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: defaultFontFamily,
                color: darkThemeTextColor,
              ),
          bodyText1: const TextStyle(
            fontFamily: defaultFontFamily,
            color: darkThemeTextColor,
            fontSize: bodyText1FontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
