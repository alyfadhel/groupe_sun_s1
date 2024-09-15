import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getLightTheme()
{
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:  const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 25.0,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 100.0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
          fontSize: 14.0,
          color: Colors.white
      ),
    ),
  );
}

ThemeData getDarkTheme()
{
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme:  const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
         size: 25.0,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 100.0,
    ),
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[300],
      ),
      titleMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.grey[300]
      ),
    ),
  );
}