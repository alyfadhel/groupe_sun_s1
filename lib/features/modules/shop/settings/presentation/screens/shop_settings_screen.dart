import 'package:flutter/material.dart';

class ShopSettingsScreen extends StatelessWidget {
  const ShopSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Shop Settings Screen',style: Theme.of(context).textTheme.headlineLarge,),
    );
  }
}
