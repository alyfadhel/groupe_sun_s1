import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/share/themes/cubit/cubit.dart';
import 'package:group_sun_s1/features/modules/shop/home/data/models/categories_model.dart';
import 'package:shimmer/shimmer.dart';

class BuildCategoriesItem extends StatelessWidget {
  final CategoriesDataDetailsModel model;

  const BuildCategoriesItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            color: Colors.grey[200]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              child: CachedNetworkImage(
                width: 150.0,
                imageUrl: model.image,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                  color: Colors.grey,
                  size: 100,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(
                model.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 25,
                      color: ThemeCubit.get(context).isDark
                          ? Colors.black
                          : Colors.black,
                    ),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color:
                  ThemeCubit.get(context).isDark ? Colors.black : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
