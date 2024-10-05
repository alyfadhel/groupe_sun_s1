import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/share/themes/cubit/cubit.dart';
import 'package:group_sun_s1/features/modules/shop/home/data/models/categories_model.dart';
import 'package:shimmer/shimmer.dart';

class BuildCategoriesHomeItems extends StatelessWidget {
  final CategoriesDataDetailsModel model;
  const BuildCategoriesHomeItems({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          child: CachedNetworkImage(
            height: 150.0,
            width: 150.0,
            fit: BoxFit.cover,
            imageUrl:
            model.image,
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
              size: 100.0,
            ),
          ),
        ),
        Container(
          width: 150.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(
              .5,
            ),
          ),
          child: Text(
            model.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ThemeCubit.get(context).isDark ? Colors.white : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
