import 'package:flutter/material.dart';

// state less
// contain one provide widget

// state full
// first class provide widget
// second class provide state from this widget

// 1- constructor
// 2- init state
// 3- build

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}
int count = 1;

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {

                  });
                  count--;
                  print(count);
                },
                icon: const Icon(
                  Icons.remove,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                '$count',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              IconButton(
                onPressed: () {
                  setState(() {

                  });
                  count++;
                  print(count);
                },
                icon: const Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
