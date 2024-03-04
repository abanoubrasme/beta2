import 'package:beta/core/decoration/Colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(

    scaffoldBackgroundColor: ColorC.backgroundLight, 
    colorScheme:  const ColorScheme(
        background: ColorC.backgroundLight, 
        brightness: Brightness.light,
        primary: ColorC.backgroundLight,
        onPrimary: ColorC.backgroundLight,
        secondary: ColorC.backgroundLight,
        onSecondary: ColorC.backgroundLight,
        error: ColorC.red,
        onError: ColorC.red,
        onBackground: ColorC.backgroundLight,
        surface: ColorC.backgroundLight,
        onSurface: ColorC.backgroundLight),


  );
}