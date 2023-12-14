// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../constants.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({required this.text, required this.onClicked});

  final String text;
  final VoidCallback onClicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        alignment: Alignment.center,
        color: Color(0xFFEB1555),
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
