import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.iconData, required this.onclicked});

  final IconData iconData;
  final VoidCallback onclicked;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onclicked,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(iconData),
    );
  }
}
