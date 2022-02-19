import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_score/themes/app_constants.dart';

class DarkTheme {
  static ThemeData of(BuildContext context) => ThemeData(
        fontFamily: defaultDarkFontFamily,
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: defaultColor,
          indicator: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(26),
              // topEnd: Radius.circular(16),
              // topStart: Radius.circular(16),
            ),
            color: defaultColor,
          ),
          labelColor: darkThemeTabIconColor,
        ),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: darkThemeIconColor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: darkHexColor,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: darkHexColor,
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontFamily: defaultDarkFontFamily,
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
        scaffoldBackgroundColor: darkHexColor,
        primarySwatch: defaultColor,
        // primaryColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: defaultColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkHexColor,
          selectedItemColor: defaultColor,
          unselectedItemColor: Colors.grey,
          elevation: 20,
          type: BottomNavigationBarType.fixed,
        ),
        textTheme: TextTheme(
          subtitle1: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontFamily: defaultDarkFontFamily,
                color: darkThemeTextColor,
              ),
          bodyText2: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: defaultDarkFontFamily,
                color: darkThemeTextColor,
              ),
          bodyText1: const TextStyle(
            fontFamily: defaultDarkFontFamily,
            color: darkThemeTextColor,
            fontSize: bodyText1FontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
