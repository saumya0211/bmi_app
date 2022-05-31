import 'dart:math';
class Calculate{
  Calculate(this.height,this.weight);
  final int height;
  final int weight;
  late double _bmi =weight/pow(height/100, 2);

  String CalculateBmi(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String GetBMINumCategory(){
    if(_bmi>=40){
      return 'Obese(Class III)';
    }else if(_bmi>35 && _bmi < 39.9){
      return 'Obese(Class II)';
    }else if(_bmi>30 && _bmi<34.9){
      return 'Obese(Class I)';
    }else if(_bmi>25 && _bmi<29.9){
      return 'Overweight(Pre-Obese)';
    }else if(_bmi>18.5 && _bmi<24.9){
      return 'Normal';
    }else if(_bmi>17 && _bmi<18.4){
      return 'Underweight(Mild Thinness)';
    }else if(_bmi>16 && _bmi<16.9){
      return 'Underweight(Moderate Thinness)';
    }
    else{
      return 'Underweight(Severe Thinness)';
    }
  }

  String GetInterpret(){
    if(_bmi>=24.9){
      return'You are in unhealty state!!!, Do excerise to get that desirable BMI';
    }else if(_bmi>=18.5 && _bmi<24.9){
      return'Congrats!!!, You are in good state ,Do keep this good work';
    }
    else{
      return'You are weak little bit , Try putting up some muscles and Eat Properly';
    }
  }
}