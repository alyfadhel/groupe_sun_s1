import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/shop_layout/controller/cubit/cubit.dart';
import 'package:group_sun_s1/features/modules/shop/home/data/models/home_model.dart';
import 'package:shimmer/shimmer.dart';

class BuildProductItem extends StatelessWidget {
  final ProductsModel model;
  const BuildProductItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
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
                      size: 100.0,
                    ),
                  ),
                ),
                if (model.discount != 0)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text(
                        'DISCOUNT',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Text(
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(height: 1.2, fontSize: 16),
          ),
          Row(
            children: [
              Text(
                model.price.round().toString(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              if (model.discount != 0)
                Text(
                  model.oldPrice.round().toString(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 2),
                ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  ShopCubit.get(context).getChangeFavorites(model.id);
                },
                icon: CircleAvatar(
                  radius: 16.0,
                  backgroundColor: ShopCubit.get(context).favorites[model.id] == true? Colors.blue : Colors.grey,
                  child: const Icon(
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
    );
  }
}
