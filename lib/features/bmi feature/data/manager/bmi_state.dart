part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}
class BmiMaleColorSTate extends BmiState {}
class BmiFemaleColorState extends BmiState {}
class SliderState extends BmiState {}
class increamentState extends BmiState {}
class decreamentState extends BmiState {}
class calculateBMIValueState extends BmiState {}

