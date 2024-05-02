
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/manager/bmi_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_gender_container.dart';
import '../widgets/custom_slider_container.dart';
import '../widgets/custom_weightage_container.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.purple.shade50,
          appBar: AppBar(
            title: const Text("Bmi Calculator", style: TextStyle(
                fontFamily: "frosty", fontSize: 35, color: Colors.white),),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
            Column(children: [
              Row(children: [
                CustomGenderContainer(icon: Icons.male, iconTitle: "Male",
                    color: BlocProvider
                        .of<BmiCubit>(context)
                        .maleColor,
                    ontabb: () {
                      BlocProvider.of<BmiCubit>(context).updateMaleColor();
                    }
                ),
                 SizedBox(width: width*0.030,),
                CustomGenderContainer(icon: Icons.female, iconTitle: "Female",
                    color: BlocProvider
                        .of<BmiCubit>(context)
                        .femaleColor,
                    ontabb: () {
                      BlocProvider.of<BmiCubit>(context).updateFemaleColor();
                    }),
              ],),
               SizedBox(height: height*0.0300,),

               CustomSLiderContainer(),
              SizedBox(height: height*0.0300,),
                Row(
                children: [
                 CustomContainer(title: "Weight",
                      flag: true),
                  SizedBox(width: width*0.030,),
                  CustomContainer(title: "Age",
                      flag: false)
                ],
              ),
              SizedBox(height: height*0.03900,),
             const CustomButton(),
            ],
            ),
          ),
        );
      },
    );
  }
}