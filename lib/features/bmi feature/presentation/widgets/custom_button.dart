import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/manager/bmi_cubit.dart';
import '../screens/result_screen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: 50,
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<BmiCubit>(context).calculateBMIValue();
          Navigator.push(context,  MaterialPageRoute(builder: (context){
            return ResultScreen();
          }));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors
                .black)),
        child: const Text(
          "Calculate", style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
            fontFamily: "frosty"),
        ),
      ),
    );
  }
}
