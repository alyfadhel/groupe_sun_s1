import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildItems extends StatelessWidget {
  final Map model;
  const BuildItems({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            child: CachedNetworkImage(
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
              imageUrl:
              model['urlToImage'].toString(),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error_outline,
                size: 100.0,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 150.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    model['publishedAt'],
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
