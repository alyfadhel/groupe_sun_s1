import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_cubit.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_state.dart';
import 'package:group_sun_s1/core/share/widgets/news_widgets/build_news_item.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return BuildNewsItem(list: list);
      },
    );
  }
}
