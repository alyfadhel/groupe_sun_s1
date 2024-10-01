import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/share/widgets/news_widgets/build_items.dart';

class BuildNewsItem extends StatelessWidget {
  final List list;
  final bool isLoading;

  const BuildNewsItem({
    super.key,
    required this.list,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => BuildItems(model: list[index]),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        itemCount: list.length,
      ),
      fallback: (context) => isLoading ? Container() : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
