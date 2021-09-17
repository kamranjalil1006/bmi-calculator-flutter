import 'dart:math';

class BMICalculatorBrain {
  BMICalculatorBrain({required this.weight, required this.height});

  int height;
  int weight;
  double _bmi = 0.0;

  String getResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResultText() {
    if (_bmi > 30) {
      return 'Obese';
    } else if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String advice() {
    if (_bmi > 30) {
      return 'Eat Balanced Diet and Exercise Daily';
    } else if (_bmi >= 25) {
      return 'Eat healthy meals and Exercise more than 4 times a week';
    } else if (_bmi >= 19) {
      return 'Excellent your BMI is looking Good';
    } else {
      return 'Eat 3-5 meals per day including lots of Proteins';
    }
  }
}
