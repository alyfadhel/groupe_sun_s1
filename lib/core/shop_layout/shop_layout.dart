import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/share/network/local/cache_helper.dart';
import 'package:group_sun_s1/core/share/themes/cubit/cubit.dart';
import 'package:group_sun_s1/core/share/themes/cubit/state.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/cubit.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/state.dart';
import 'package:group_sun_s1/features/modules/shop/users/presentation/screens/shop_login_screen.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
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
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
