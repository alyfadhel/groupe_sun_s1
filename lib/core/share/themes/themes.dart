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
        statusBarColor: Colors.white,
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.blue,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 14.0,
        color: Colors.grey,
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
          statusBarColor: Colors.black
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.deepOrange,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 14.0,
        color: Colors.grey,
      ),
    ),
  );
}