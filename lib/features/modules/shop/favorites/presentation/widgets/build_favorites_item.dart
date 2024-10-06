import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/share/themes/cubit/cubit.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/cubit.dart';
import 'package:group_sun_s1/features/modules/shop/favorites/data/models/get_favorites.dart';
import 'package:shimmer/shimmer.dart';

class BuildFavoritesItem extends StatelessWidget {
  final GetFavoritesProduct model;
  const BuildFavoritesItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            color: Colors.grey[200]

        ),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                child: CachedNetworkImage(
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
                    size: 100,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ThemeCubit.get(context).isDark ? Colors.black : Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.round().toString(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      if(model.discount != 0)
                      Text(
                        model.oldPrice.round().toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red,
                            decorationThickness: 2
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).getChangeFavorites(model.id);
                        },
                        icon:  const CircleAvatar(
                          radius: 16.0,
                          backgroundColor:  Colors.blue,
                          child: Icon(
                            Icons.favorite_border,
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
