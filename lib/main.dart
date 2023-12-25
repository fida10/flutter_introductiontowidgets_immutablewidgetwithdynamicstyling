/*
Question 1: Immutable Widget with Dynamic Styling

Task:

Create a Flutter application that features an immutable widget similar to ImmutableWidget. This widget should dynamically change its styling (color, shape, etc.) based on user interaction (e.g., button press).
 */

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'introductiontowidgets_immutablewidgetwithdynamicstyling',
      //theme: ,
      home: YourImmutableWidget(),
    );
  }
}

class YourImmutableWidget extends StatefulWidget {
  const YourImmutableWidget({super.key});

  @override
  State<YourImmutableWidget> createState() => _YourImmutableWidgetState();
}

class _YourImmutableWidgetState extends State<YourImmutableWidget> {
  final possibleColors = <MaterialColor>[
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple
  ];

  MaterialColor currentColor = Colors.grey;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center( //one center interestingly centers every child in the column
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(color: currentColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentColor =
                        possibleColors[random.nextInt(possibleColors.length)];
                  });
                },
                child: Text(
                  'Press me!',
                  style: TextStyle(color: currentColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
