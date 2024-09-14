import 'package:flutter/material.dart';
import 'package:group_sun_s1/messenger_model.dart';

class BuildChatItem extends StatelessWidget {
  final MessengerModel model;
  const BuildChatItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
          radius: 35,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    model.image,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 5,
                    top: 5,
                  ),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 7.0,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                model.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 3,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '02:00 pm',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
