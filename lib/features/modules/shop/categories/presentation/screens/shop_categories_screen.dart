import 'package:flutter/material.dart';

class ShopCategoriesScreen extends StatelessWidget {
  const ShopCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Shop Categories Screen',style: Theme.of(context).textTheme.headlineLarge,),
    );
  }
}
