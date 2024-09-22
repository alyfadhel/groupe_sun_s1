import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Done Tasks',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
