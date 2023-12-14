import 'dart:math';

class Calculate {
  Calculate({required this.height, required this.weight});

  final int weight;
  final int height;
  late double _bmi;

  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have heigher than normal weight try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight';
    } else {
      return 'You have lower than normal body weight try to gain weight';
    }
  }
}
