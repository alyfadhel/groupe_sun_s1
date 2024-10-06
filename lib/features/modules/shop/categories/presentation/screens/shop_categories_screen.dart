import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/cubit.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/state.dart';
import 'package:group_sun_s1/features/modules/shop/categories/presentation/widgets/build_categories_item.dart';

class ShopCategoriesScreen extends StatelessWidget {
  const ShopCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ListView.separated(
          itemBuilder: (context, index) => BuildCategoriesItem(model: cubit.categoriesModel!.data.data[index],),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10.0,
          ),
          itemCount: cubit.categoriesModel!.data.data.length,
        );
      },
    );
  }
}
