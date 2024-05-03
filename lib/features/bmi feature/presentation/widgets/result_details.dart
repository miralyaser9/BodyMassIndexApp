import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/manager/bmi_cubit.dart';

class ResultDetails extends StatelessWidget {
  const ResultDetails({super.key});
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return  Column(
      children: [
        Text("Your Gender is ${BlocProvider.of<BmiCubit>(context).gender}",style: const TextStyle(fontWeight: FontWeight.bold),),
        Text("Your Age  is ${BlocProvider.of<BmiCubit>(context).age} Years",style: const TextStyle(fontWeight: FontWeight.bold),),
        Text("Your Weight  is ${BlocProvider.of<BmiCubit>(context).weight} Kg",style: const TextStyle(fontWeight: FontWeight.bold),),
        Text("Your Height  is ${BlocProvider.of<BmiCubit>(context).sliderValue.round()} CM",style: const TextStyle(fontWeight: FontWeight.bold),),
        Text("Your BMI Value  is ${BlocProvider.of<BmiCubit>(context).bmi} KG/m2",style: const TextStyle(fontWeight: FontWeight.bold),),
         SizedBox(height: height*0.0300,),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
                " Category is  ${BlocProvider.of<BmiCubit>(context).determineCategory()}💜",
                textStyle: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.purple ),
                speed: const Duration(milliseconds: 100)
            ),
          ],
          totalRepeatCount: 1,
          stopPauseOnTap: true,
          displayFullTextOnTap: true,
        ),
        SizedBox(height: height*0.0300,),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(24)),
              gradient: LinearGradient(colors: [Colors.white,Colors.purple.shade200],
                  begin: Alignment.topLeft,end: Alignment.bottomRight
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Advice For You !",style: TextStyle(decoration: TextDecoration.underline,fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 22,),
                Text("${BlocProvider.of<BmiCubit>(context).showAdvice()}",style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
