import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/share/network/local/cache_helper.dart';
import 'package:group_sun_s1/core/share/themes/cubit/cubit.dart';
import 'package:group_sun_s1/core/share/themes/cubit/state.dart';
import 'package:group_sun_s1/features/modules/shop/users/presentation/screens/shop_login_screen.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  ThemeCubit.get(context).changeThemeMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  CacheHelper.removeData(key: 'token').then(
                    (value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShopLoginScreen(),
                        ),
                      );
                    },
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                  Colors.red,
                )),
                child: Text('LogOut'),
              ),
            ],
          ),
        );
      },
    );
  }
}
