import 'package:bmialculator/bmi%20feature/data/manager/bmi_cubit.dart';
import 'package:bmialculator/bmi%20feature/presentation/widgets/custom_gender_container.dart';
import 'package:bmialculator/bmi%20feature/presentation/widgets/custom_slider_container.dart';
import 'package:bmialculator/bmi%20feature/presentation/widgets/custom_weightage_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Bmi Calculator", style: TextStyle(
                fontFamily: "frosty", fontSize: 35, color: Colors.white),),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
            SingleChildScrollView(
              child: Column(children: [
                Row(children: [
                  CustomGenderContainer(icon: Icons.male, iconTitle: "Male",
                      color: BlocProvider
                          .of<BmiCubit>(context)
                          .maleColor,
                      ontabb: () {
                        BlocProvider.of<BmiCubit>(context).updateMaleColor();
                      }
                  ),
                  const SizedBox(width: 10,),
                  CustomGenderContainer(icon: Icons.female, iconTitle: "Female",
                      color: BlocProvider
                          .of<BmiCubit>(context)
                          .femaleColor,
                      ontabb: () {
                        BlocProvider.of<BmiCubit>(context).updateFemaleColor();
                      }),
                ],),
                const SizedBox(height: 20,),

                 CustomSLiderContainer(),
                const SizedBox(height: 20,),

                  Row(
                  children: [
                   CustomContainer(title: "Weight",
                        flag: true),
                    SizedBox(width: 10,),
                    CustomContainer(title: "Age",
                        flag: false)

                  ],
                ),
                const SizedBox(height: 20,),
                Container(width: double.infinity, height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<BmiCubit>(context).calculateBMIValue();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors
                            .pink)),
                    child: const Text(
                      "Calculate", style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "frosty"),),

                  ),
                ),
                Text("Your Body Mass Index  is ${ BlocProvider
                    .of<BmiCubit>(context)
                    .bmi} kg/m2 "
                  , style: const TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                      fontSize: 21),)

              ],
              ),
            ),
          ),

        );
      },
    );
  }
}