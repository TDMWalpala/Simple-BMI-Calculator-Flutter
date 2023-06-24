import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;
  String gender = '';
  late double bmi = calculateBMI(height, weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print("Male");
                  setState(() {
                    gender = "Male";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  // color: Colors.orange.withAlpha(50),
                  height: 200,
                  width: 175,
                  decoration: BoxDecoration(
                      color: gender == 'Male'? Colors.orange.withAlpha(150) : Colors.orange.withAlpha(50),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.male,
                        size: 100,
                      ),
                      const Text("Male"),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  print("Female");
                  setState(() {
                    gender = "Female";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                     color: gender== 'Female'? Colors.orange.withAlpha(150) : Colors.orange.withAlpha(50),
                      borderRadius: BorderRadius.circular(20)),
                  height: 200,
                  width: 175,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.female,
                        size: 100,
                      ),
                      const Text("Female"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Height"),
                    Text(
                      "$height",
                      style: kInputLabelColor,
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (height > 50) {
                                height--;
                                bmi = calculateBMI(height, weight);
                              }
                            });
                            print(height);
                          },
                          child: Icon(
                            Icons.remove,
                            size: 40,
                          ),
                        ),
                        const SizedBox(width: 20),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (height < 220) {
                                height++;
                                bmi = calculateBMI(height, weight);
                              }
                            });
                            print(height);
                          },
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Weight"),
                    Text(
                      "$weight",
                      style: kInputLabelColor,
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (weight > 35) {
                                weight--;
                                bmi = calculateBMI(height, weight);
                              }
                            });
                            print(weight);
                          },
                          child: Icon(
                            Icons.remove,
                            size: 40,
                          ),
                        ),
                        const SizedBox(width: 10),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (weight < 300) {
                                weight++;
                                bmi = calculateBMI(height, weight);
                              }
                            });
                            print(weight);
                          },
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text("BMI"),
              Text(
                "${bmi.toStringAsFixed(2)}",
                style: kInputLabelColor.copyWith(color: kOutPutTexColor),
              ),
              Text(getResult(bmi)),
            ],
          )
        ]),
      ),
    );
  }

  double calculateBMI(int height, int weight) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmi) {
    if (bmi < 15) {
      return ("You are in 'Very severely underweight' Category");
    } else if (bmi >= 15 && bmi < 16) {
      return ("You are in 'Severely underweight' Category");
    } else if (bmi >= 16 && bmi < 18.5) {
      return ("You are in 'Underweight' Category");
    } else if (bmi >= 18.5 && bmi < 25) {
      return ("You are in 'Normal (healthy weight)' Category");
    } else if (bmi >= 25 && bmi < 30) {
      return ("You are in 'Overweight' Category");
    } else if (bmi >= 30 && bmi < 35) {
      return ("You are in 'Moderately obese' Category");
    } else if (bmi >= 35 && bmi < 40) {
      return ("You are in 'Severely obese' Category");
    } else if (bmi > 40) {
      return ("You are in 'Very severely obese' Category");
    } else {
      return ("---------------------");
    }
  }
}
