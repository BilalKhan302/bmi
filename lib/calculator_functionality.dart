import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.weight,required this.height});
  final int height;
  final int weight;
 late double _bmi=0;
  String calculateBMI(){
    _bmi=weight/ pow(height/ 100,2);
   return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return "overWeight";
    }else if(_bmi>18.5){
      return "Normal";
    }else {
      return "UnderWeight";
    }
  }
  String getInter(){
    if(_bmi>=25){
      return "You have higher than normal body weight. Try to exercise more.";
    }else if(_bmi>18.5){
      return "You have normal body weight. Good job.";
    }else {
      return "You have lower than normal body weight. You can eat a bit more.";
    }
  }
}