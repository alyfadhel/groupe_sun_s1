import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/layout/todo_app.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => buildTasksItems(context, tasks[index]),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0
        ),
        child: Divider(
          height: 1.0,
          color: Colors.grey,
        ),
      ),
      itemCount: tasks.length,
    );
  }
}

Widget buildTasksItems(context, Map model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.blue,
            child: Text(
              model['time'],
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model['title'],
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                model['date'],
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
