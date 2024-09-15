import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Widget> action = [
    //
    // ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // toolbarHeight: 90,
        // leadingWidth: 80,
        // leading: const Icon(
        //   Icons.menu,
        //   size: 30,
        //   color: Colors.white,
        // ),
        // centerTitle: true,
        title: const Text(
          'First App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_on_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // body: Container(
      //   height: double.infinity,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     // 3+3+3+3 = 12
      //     //1+1+1+1  = 4
      //     children: [
      //       Container(
      //         color: Colors.red,
      //         child: const Text(
      //           'First Word',
      //           style: TextStyle(
      //             fontSize: 30.0,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //       // Expanded(
      //       //
      //       //   child: Container(
      //       //     color: Colors.blue,
      //       //     child: const Text(
      //       //       'Second Word',
      //       //       style: TextStyle(
      //       //         fontSize: 30.0,
      //       //         color: Colors.white,
      //       //       ),
      //       //     ),
      //       //   ),
      //       // ),
      //       // Expanded(
      //       //
      //       //   child: Container(
      //       //     color: Colors.green,
      //       //     child: const Text(
      //       //       'Third Word',
      //       //       style: TextStyle(
      //       //         fontSize: 30.0,
      //       //         color: Colors.white,
      //       //       ),
      //       //     ),
      //       //   ),
      //       // ),
      //       // Expanded(
      //       //   child: Container(
      //       //     color: Colors.amber,
      //       //     child: const Text(
      //       //       'Fourth Word',
      //       //       style: TextStyle(
      //       //         fontSize: 30.0,
      //       //         color: Colors.white,
      //       //       ),
      //       //     ),
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                 borderRadius: BorderRadiusDirectional.only(
                   topStart: Radius.circular(20.0,),
                 ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        .7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 200,
                    child: const Text(
                      'Flowers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void onClick()
// {
//   debugPrint(
//     'notification clicked',
//   );
// }
