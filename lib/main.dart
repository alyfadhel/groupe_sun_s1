import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/layout/todo_app.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_cubit.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_state.dart';
import 'package:group_sun_s1/core/news_layout/news_layout.dart';
import 'package:group_sun_s1/core/share/network/remote/dio_helper.dart';
import 'package:group_sun_s1/core/share/observer.dart';
import 'package:group_sun_s1/features/modules/bmi/bmi_calculator.dart';
import 'package:group_sun_s1/core/share/themes/themes.dart';
import 'package:group_sun_s1/features/modules/counter/counter_screen.dart';
import 'package:group_sun_s1/features/modules/login/login_screen.dart';


void main()
{
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> NewsCubit()..getBusiness()..getSpots()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: getLightTheme(),
            // darkTheme: getDarkTheme(),
            // themeMode: ThemeMode.dark,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}


