import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/layout/controller/cubit/cubit.dart';
import 'package:group_sun_s1/core/layout/controller/cubit/state.dart';
import 'package:group_sun_s1/core/layout/todo_app.dart';
import 'package:group_sun_s1/core/share/widgets/build_tasks.dart';
import 'package:group_sun_s1/core/share/widgets/build_tasks_item.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return BuildTasks(
          tasks: tasks,
        );
      },
    );
  }
}
