import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_cubit.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_state.dart';
import 'package:group_sun_s1/core/share/widgets/news_widgets/build_items.dart';
import 'package:group_sun_s1/core/share/widgets/news_widgets/build_news_item.dart';
import 'package:shimmer/shimmer.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return BuildNewsItem(list: list);
      },
    );
  }
}
