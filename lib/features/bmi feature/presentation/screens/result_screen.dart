import 'package:bmialculator/features/bmi%20feature/presentation/screens/bmi_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../data/manager/bmi_cubit.dart';
import '../widgets/result_details.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple.shade50,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0,left: 16,right: 16,bottom: 16),
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 280),
                  child: IconButton(
                    splashColor: Colors.purple,
                      onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiScreen()));
                  }, icon: const Icon(Icons.home,size: 28,)),
                ),
                Center(
                  child: CircularPercentIndicator(
                    animationDuration: 1500,
                    animation: true,
                      radius: 100,
                    lineWidth: 22,
                    percent:BlocProvider.of<BmiCubit>(context).bmi/100,
                    progressColor: Colors.purple,
                    backgroundColor: Colors.purple.shade100,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text("${BlocProvider.of<BmiCubit>(context).bmi}%",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  ),
                ),
            SizedBox(height: height*0.0300,),
               const ResultDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
