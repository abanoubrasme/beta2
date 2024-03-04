import 'package:beta/core/decoration/Colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme(){
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    scaffoldBackgroundColor: ColorC.backgroundDark,
    colorScheme:  const ColorScheme(
        background: ColorC.backgroundDark,
        brightness: Brightness.dark,
        primary: ColorC.backgroundDark,
        onPrimary: ColorC.backgroundDark,
        secondary: ColorC.backgroundDark,
        onSecondary:ColorC.backgroundDark,
        error: ColorC.red,
        onError: ColorC.red,
        onBackground:ColorC.backgroundDark,
        surface: ColorC.backgroundDark,
        onSurface: ColorC.backgroundDark),



  );
}