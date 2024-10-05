import 'package:flutter/material.dart';

class ShopFavoritesScreen extends StatelessWidget {
  const ShopFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Shop Favorites Screen',style: Theme.of(context).textTheme.headlineLarge,),
    );
  }
}
