import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final int age;
  final bool isMale;
  final double result;

  const BmiResult({
    super.key,
    required this.age,
    required this.isMale,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          "BMI RESULT",
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GENDER: ${isMale ? 'MALE' : 'FEMALE'}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'RESULT: ${result.round()}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'AGE: $age',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
