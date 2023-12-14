// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:bmi_calculator/Calculate.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/icon_content.dart';
import '../components/large_button.dart';
import '../components/reusable_card.dart';
import '../components/round_button.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 100;

  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'BMI CALCULATOR',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    onPress: () => setState(
                      () {
                        selectedGender = Gender.male;
                      },
                    ),
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () => setState(
                      () {
                        selectedGender = Gender.female;
                      },
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReuseableCard(
                onPress: () {},
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kTextStyle2,
                        ),
                        Text(
                          'cm',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newVal) {
                        // print(newVal);
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {},
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kTextStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onclicked: () => setState(() {
                                  weight++;
                                }),
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onclicked: () => setState(() {
                                  weight--;
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {},
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kTextStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onclicked: () => setState(() {
                                  age++;
                                }),
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onclicked: () => setState(() {
                                  age--;
                                }),
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
            LargeButton(
                text: 'CALCULATE',
                onClicked: () {
                  Calculate calculate =
                      Calculate(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResults: calculate.calculateBMI(),
                        interpretation: calculate.getInterpretation(),
                        resultTests: calculate.getResult(),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
