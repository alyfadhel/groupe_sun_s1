import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/share/themes/cubit/cubit.dart';
import 'package:group_sun_s1/core/share/widgets/toast.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/cubit.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/state.dart';
import 'package:group_sun_s1/features/modules/shop/favorites/presentation/widgets/build_favorites_item.dart';
import 'package:shimmer/shimmer.dart';

class ShopFavoritesScreen extends StatelessWidget {
  const ShopFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopGetChangeFavoritesSuccessState) {
          if (state.changeFavoritesModel.status) {
            showToast(
              msg: state.changeFavoritesModel.message,
              state: ToastState.success,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        if (cubit.getFavoritesModel!.data!.data.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (context, index) => BuildFavoritesItem(
              model: cubit.getFavoritesModel!.data!.data[index].product,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemCount: cubit.getFavoritesModel!.data!.data.length,
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Favorites Yet',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.grey,
                        fontSize: 40,
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 100,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
