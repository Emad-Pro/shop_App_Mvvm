import 'package:flutter/material.dart';

class CustomThemeMode {
  static ThemeData lightTheme() => ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrangeAccent,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange, brightness: Brightness.light),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
        ),
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(fontFamily: "rubik-Light"),
      );
  static ThemeData darkTheme() => ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.deepOrangeAccent,
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange, brightness: Brightness.dark),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
      ),
      useMaterial3: true,
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: "rubik-Light"));
}
