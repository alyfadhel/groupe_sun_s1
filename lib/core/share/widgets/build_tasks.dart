import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/share/widgets/build_tasks_item.dart';

class BuildTasks extends StatelessWidget {
  final List<Map>tasks;
  const BuildTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) =>
            BuildTasksItem(model: tasks[index]),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Tasks Yet',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Icon(
              Icons.menu,
              color: Colors.grey,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
