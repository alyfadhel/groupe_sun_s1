import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/layout/controller/cubit/cubit.dart';

class BuildTasksItem extends StatelessWidget {
  final Map model;

  const BuildTasksItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction)
      {
        AppCubit.get(context).deleteDataFromDatabase(id: model['id']);
      },
      child: Padding(
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
            Expanded(
              child: Column(
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
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDataFromDatabase(status: 'done', id: model['id']);
              },
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDataFromDatabase(status: 'archive', id: model['id']);
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
