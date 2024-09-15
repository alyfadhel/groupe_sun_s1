import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_sun_s1/build_chat_item.dart';
import 'package:group_sun_s1/build_story_item.dart';
import 'package:group_sun_s1/messenger_model.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        titleSpacing: 20,
        toolbarHeight: 80,
        leadingWidth: 50,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 33,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    'assets/images/image.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20.0, vertical: 3),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search_rounded,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Search',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10.0,
                  ),
                  itemBuilder: (context, index) => BuildStoryItem(
                    model: messenger[index],
                  ),
                  itemCount: messenger.length,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => BuildChatItem(
                  model: messenger[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: messenger.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




