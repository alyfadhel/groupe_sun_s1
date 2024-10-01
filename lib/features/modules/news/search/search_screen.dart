import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_cubit.dart';
import 'package:group_sun_s1/core/news_layout/controller/news_state.dart';
import 'package:group_sun_s1/core/share/widgets/my_text_form_field.dart';
import 'package:group_sun_s1/core/share/widgets/news_widgets/build_news_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              children: [
                MyTextFormField(
                  controller: cubit.searchController,
                  radius: 15.0,
                  type: TextInputType.text,
                  text: 'search',
                  prefix: Icons.search,
                  validator: (value) {},
                  onChanged: (text) {
                    cubit.getSearch(text: text);
                  },
                ),
                Expanded(
                  child: BuildNewsItem(
                    list: list,
                    isLoading: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
