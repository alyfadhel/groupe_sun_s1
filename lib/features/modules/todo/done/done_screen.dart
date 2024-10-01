import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/layout/controller/cubit/cubit.dart';
import 'package:group_sun_s1/core/layout/controller/cubit/state.dart';
import 'package:group_sun_s1/core/share/widgets/build_tasks.dart';


class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).doneTasks;
        return BuildTasks(
          tasks: tasks,
        );
      },
    );
  }
}


