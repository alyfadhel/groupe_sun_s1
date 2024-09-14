import 'package:flutter/material.dart';
import 'package:group_sun_s1/messenger_model.dart';

class BuildStoryItem extends StatelessWidget {
  final MessengerModel model;
  const BuildStoryItem({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Padding(
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
            height: 8.0,
          ),
          Text(
            model.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
