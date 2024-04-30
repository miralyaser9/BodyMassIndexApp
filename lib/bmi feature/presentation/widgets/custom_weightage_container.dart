import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/manager/bmi_cubit.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.title,required this.flag});

 final String title;
 final bool flag;



  @override
  Widget build(BuildContext context) {
    return  Expanded(child: Container(decoration:
    BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.white24,offset:Offset(5,5))]
        ,color: Colors.yellowAccent,borderRadius: BorderRadius.circular(16)
    ),
      child:
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: const TextStyle(fontFamily: "frosty",fontSize: 35,fontWeight: FontWeight.bold),)

            ,Text(flag? BlocProvider.of<BmiCubit>(context).weight.toString(): BlocProvider.of<BmiCubit>(context).age.toString(),

                style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold))
            ,Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: (){
                  BlocProvider.of<BmiCubit>(context).decreamentButton(flag);

                },mini: true,child: const Icon(Icons.remove),),
                const SizedBox(width: 10,),
                FloatingActionButton(onPressed: (){
                  BlocProvider.of<BmiCubit>(context).increamentButton(flag);

                },mini: true,child: const Icon(Icons.add),),

              ],)
          ],),
      ),
    )
    );
  }
}
