import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white10,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffd4a373),
        onPrimary: Color(0xff023047),
        secondary: Color(0xff8ecae6),
        onSecondary: Color(0xff780000),
        error: Color(0xffc1121f),
        onError: Color(0xffe0e1dd),
        surface: Colors.grey,
        onSurface: Colors.black),);
