import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_cubit.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_state.dart';
import 'package:group_sun_s1/core/news_layout/news_layout.dart';
import 'package:group_sun_s1/core/share/const/const.dart';
import 'package:group_sun_s1/core/share/network/local/cache_helper.dart';
import 'package:group_sun_s1/core/share/network/remote/dio_helper.dart';
import 'package:group_sun_s1/core/share/observer.dart';
import 'package:group_sun_s1/core/share/themes/cubit/cubit.dart';
import 'package:group_sun_s1/core/share/themes/cubit/state.dart';
import 'package:group_sun_s1/core/share/themes/themes.dart';
import 'package:group_sun_s1/core/shop_layout/shop_layout.dart';
import 'package:group_sun_s1/features/modules/login/login_screen.dart';
import 'package:group_sun_s1/features/modules/shop/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:group_sun_s1/features/modules/shop/users/presentation/screens/shop_login_screen.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  NewsDioHelper.init();
  Bloc.observer = MyBlocObserver();
  bool?onBoarding = CacheHelper.getData(key: 'onBoarding');
  print(onBoarding);
  token = CacheHelper.getData(key: 'token');
  print(token.toString());
  bool?isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;

  if(onBoarding != null){
    if(token != null){
      widget = const ShopLayout();
    }else{
      widget = const ShopLoginScreen();
    }
  }else{
    widget = const OnBoardingScreen();
  }
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
     MyApp(
      startWidget: widget,
     isDark: isDark,
    )
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool? isDark;
  const MyApp({super.key, required this.startWidget, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context)=> NewsCubit()..getBusiness()..getSpots()..getScience(),),
        BlocProvider(create: (context) => ThemeCubit()..changeThemeMode(
          fromShared: isDark,
        ),)
      ],
      child: BlocConsumer<ThemeCubit,ThemeStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getLightTheme(),
              darkTheme: getDarkTheme(),
              themeMode: ThemeCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
              home: startWidget,
            );
          },
        ),
    );
  }
}


