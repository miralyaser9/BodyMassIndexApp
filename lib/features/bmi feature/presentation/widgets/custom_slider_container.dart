import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/manager/bmi_cubit.dart';

class CustomSLiderContainer extends StatelessWidget {
  const CustomSLiderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.white24,offset:Offset(5,10))]
          ,color: Colors.cyanAccent,borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [Colors.white,Colors.purple.shade200],
              begin: Alignment.bottomRight,end: Alignment.topLeft
          )
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text("Height",style: TextStyle(fontFamily: "frosty",fontSize: 40,fontWeight: FontWeight.bold),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(BlocProvider.of<BmiCubit>(context).sliderValue.round().toString()
                    ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)
                  ,const Text("cm",style: TextStyle(fontSize: 25),)],)
              ,
              Slider(
                activeColor: Colors.purpleAccent,
                  value: BlocProvider.of<BmiCubit>(context).sliderValue,
                  max: 250,
                  min: 0,
                  onChanged: (changedValue){
                    BlocProvider.of<BmiCubit>(context).updateSliderValue(changedValue: changedValue);
                  }
              )
            ],),
        ),
      ),

    );;
  }
}
