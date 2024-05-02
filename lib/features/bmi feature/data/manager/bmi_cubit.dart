
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());


  double sliderValue=160;
  String gender="";
  int weight=60;
  int age=25;
  bool isMale=true;
  int bmi=0;
  Color maleColor = Colors.purpleAccent.shade100;
  Color femaleColor = Colors.purpleAccent.shade100;

  void updateMaleColor() {
    gender="Male";
    isMale = true;
    maleColor = Colors.blueAccent.shade100;
    femaleColor = Colors.purpleAccent.shade100;
    emit(BmiMaleColorSTate());
  }
  void updateFemaleColor() {
    gender="Female";
    isMale = false;
    maleColor = Colors.purpleAccent.shade100;
    femaleColor = Colors.pinkAccent.shade100;
    emit(BmiFemaleColorState());
  }

  updateSliderValue({required double changedValue}){
    sliderValue=changedValue;
    emit(SliderState());
  }

  increamentButton(bool flag){

    flag?weight++:age++;
    emit(increamentState());
  }

  decreamentButton(bool flag){

    flag?weight--:age--;
    emit(decreamentState());
  }

  calculateBMIValue(){
    bmi=(weight  / ((sliderValue  / 100) * (sliderValue  / 100))).round() ;
    emit(calculateBMIValueState());
  }

 String determineCategory(){
    if(bmi<18.5){
      return 'UnderWeight';

    }
    else if(bmi>=18.5 && bmi<25){
      return 'Normal Weight';
    }
    else if(bmi>=25 && bmi<30){
      return 'OverWeight';
    }
    else{
      return 'Obese';
    }

  }

  String showAdvice(){
    if(bmi<18.5){
      return "Underweight, it's important to focus on gaining weight in a healthy way. Include more nutrient-dense foods in your diet, such as nuts, seeds, avocados, whole grains, lean meats, and dairy products. Eat frequent, balanced meals and consider incorporating resistance exercises into your routine to help build muscle mass. Speak to a healthcare professional or a registered dietitian who can provide personalized guidance.";

    }
    else if(bmi>=18.5 && bmi<25){
      return "Normal weight range, it's still crucial to maintain a healthy lifestyle. Continue to engage in regular physical activity to support your overall well-being and cardiovascular health. Aim for a balanced diet that includes a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats. Stay mindful of portion sizes and listen to your body's hunger and fullness cues. Remember to prioritize self-care and mental well-being alongside physical health.";
    }
    else if(bmi>=25 && bmi<30){
      return " Overweight category, it's important to focus on making sustainable changes to your lifestyle. Incorporate regular physical activity into your routine, such as brisk walking or cycling. Additionally, try to make healthier food choices by including more fruits, vegetables, whole grains, and lean proteins in your diet. Be mindful of portion sizes and limit your intake of sugary beverages and processed foods.";
    }
    else {
      return "Obese category, it's important to prioritize your overall health and well-being. Start by gradually incorporating regular physical activity into your routine, aiming for at least 150 minutes of moderate-intensity exercise per week. Make healthier food choices by focusing on whole, unprocessed foods and reducing your consumption of high-calorie, sugary, and fatty foods. Consider seeking support from a healthcare professional or a registered dietitian who can help you create a tailored plan to manage your weight.";
    }
  }


}
