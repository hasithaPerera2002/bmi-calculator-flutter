// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/screens/input_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderThemeData(
            activeTrackColor: Colors.white,
            thumbColor: Color(0xFFEB1555),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 15.0,
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 30.0,
            ),
            overlayColor: Color(0x29EB1555)),
      ),
    );
  }
}
