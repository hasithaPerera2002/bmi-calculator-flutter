// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';

import 'package:flutter/material.dart';

import '../components/large_button.dart';
import '../components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.bmiResults,
      required this.interpretation,
      required this.resultTests});

  final String bmiResults;
  final String resultTests;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text(
              'Your Results',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultTests,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResults,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
                onPress: () {}),
          ),
          LargeButton(
            text: 'RE-CALCULATE',
            onClicked: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputPage()),
            ),
          )
        ],
      ),
    );
  }
}
