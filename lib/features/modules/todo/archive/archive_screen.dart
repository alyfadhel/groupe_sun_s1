import 'package:flutter/material.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Archive Tasks',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
