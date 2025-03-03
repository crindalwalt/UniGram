import 'package:flutter/material.dart';
import 'package:uni_gram/views/pages/home_screen.dart';
import 'package:uni_gram/views/themes/dark_theme.dart';
import 'package:uni_gram/views/themes/light_theme.dart';

void main() {
  runApp(
    UniGramApp(),
  );
}

class UniGramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
