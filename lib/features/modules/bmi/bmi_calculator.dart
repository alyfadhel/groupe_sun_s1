import 'dart:math';
import 'package:flutter/material.dart';
import 'package:group_sun_s1/features/modules/bmi/bmi_result.dart';
import 'package:hexcolor/hexcolor.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

bool isMale = true;
double height = 150.0;
int weight = 60;
int age = 25;

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 700,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isMale ? Colors.pink : HexColor('#222222'),
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.male,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'MALE',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  !isMale ? Colors.pink : HexColor('#222222'),
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.female,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'FEMALE',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor('#222222'),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 18.0,
                                  ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${height.round()}',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Text(
                              'cm',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Slider(
                          value: height,
                          min: 0.0,
                          max: 220.0,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                          activeColor: Colors.grey.shade700,
                          thumbColor: Colors.pink,
                          inactiveColor: Colors.grey.shade500,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor('#222222'),
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '$weight',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    heroTag: 'weight--',
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        30.0,
                                      ),
                                    ),
                                    backgroundColor: Colors.grey.shade800,
                                    mini: true,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    heroTag: 'weight++',
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      30.0,
                                    )),
                                    backgroundColor: Colors.grey.shade800,
                                    mini: true,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor('#222222'),
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '$age',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    heroTag: 'age--',
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        30.0,
                                      ),
                                    ),
                                    backgroundColor: Colors.grey.shade800,
                                    mini: true,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    heroTag: 'age++',
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      30.0,
                                    )),
                                    backgroundColor: Colors.grey.shade800,
                                    mini: true,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                  width: double.infinity,
                  height: 70.0,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(
                        15.0,
                      ),
                      bottomStart: Radius.circular(
                        15.0,
                      ),
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      var result = weight / pow(height / 100, 2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiResult(
                            result: result,
                            age: age,
                            isMale: isMale,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'CALCULATE',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 25.0,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
