import 'package:flutter/material.dart';
import 'package:group_sun_s1/counter_screen.dart';
import 'package:group_sun_s1/home_screen.dart';
import 'package:group_sun_s1/login_screen.dart';
import 'package:group_sun_s1/messenger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: const CounterScreen(),
    );
  }
}


