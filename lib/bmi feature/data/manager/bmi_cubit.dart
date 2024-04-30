
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());


  double sliderValue=160;
  int weight=60;
  int age=25;
  bool isMale=true;
  int bmi=0;
  Color maleColor = Colors.greenAccent;
  Color femaleColor = Colors.greenAccent;

  void updateMaleColor() {
    isMale = true;
    maleColor = Colors.blueAccent;
    femaleColor = Colors.greenAccent;
    emit(BmiMaleColorSTate());
  }
  void updateFemaleColor() {
    isMale = false;
    maleColor = Colors.greenAccent;
    femaleColor = Colors.pink;
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
}
