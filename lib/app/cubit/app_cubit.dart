import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_score/app/cubit/app_states.dart';
import 'package:football_score/themes/dark_theme.dart';
import 'package:football_score/themes/ligth_theme.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitState());

  ThemeData? currentTheme;
  ThemeMode? currentThemeMode;

  void changeTheme(BuildContext context) {
    currentThemeMode ??= ThemeMode.system;

    if (currentThemeMode != ThemeMode.light) {
      currentTheme = LightTheme.of(context);
      currentThemeMode = ThemeMode.light;
    } else {
      currentTheme = DarkTheme.of(context);
      currentThemeMode = ThemeMode.dark;
    }

    emit(AppThemeChange());
  }
}
