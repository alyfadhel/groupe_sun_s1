import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/share/network/local/cache_helper.dart';
import 'package:group_sun_s1/core/share/widgets/my_text_button.dart';
import 'package:group_sun_s1/features/modules/login/login_screen.dart';
import 'package:group_sun_s1/features/modules/shop/on_boarding/data/models/on_boarding_model.dart';
import 'package:group_sun_s1/features/modules/shop/on_boarding/presentation/widgets/build_on_boarding_item.dart';
import 'package:group_sun_s1/features/modules/shop/users/presentation/screens/shop_login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

var controller = PageController();
bool isLast = false;

void onSubmit(context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const ShopLoginScreen(),
    ),
  );
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MyTextButton(
            onPressed: () {
              CacheHelper.setData(key: 'onBoarding', value: true).then(
                (value) {
                  if(context.mounted) {
                    onSubmit(context);
                  }
                },
              );
            },
            text: 'SKIP',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                      print(isLast);
                    });
                  } else {
                    setState(() {
                      isLast = false;
                      print(isLast);
                    });
                  }
                },
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => BuildOnBoardingItem(
                  model: boarding[index],
                ),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: boarding.length,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      spacing: 4.0,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue,
                      expansionFactor: 1.01),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      CacheHelper.setData(key: 'onBoarding', value: true).then(
                            (value) {
                          if(context.mounted) {
                            onSubmit(context);
                          }
                        },
                      );
                    }
                    controller.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
