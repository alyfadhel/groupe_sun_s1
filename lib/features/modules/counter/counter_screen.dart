import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/features/modules/counter/controller/cubit/cubit.dart';
import 'package:group_sun_s1/features/modules/counter/controller/cubit/state.dart';

// state less
// contain one provide widget

// state full
// first class provide widget
// second class provide state from this widget

// 1- constructor
// 2- init state
// 3- build

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCounterCubit(),
      child: BlocConsumer<AppCounterCubit,AppCounterStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = AppCounterCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: ()
                      {
                        cubit.decrementData();
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
                      cubit.count.toString(),
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
                        cubit.incrementData();
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
        },
      ),
    );
  }
}



