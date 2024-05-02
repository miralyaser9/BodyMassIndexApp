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
        ,color: Colors.purple,borderRadius: BorderRadius.circular(16)
    ),
      child:
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: const TextStyle(fontFamily: "frosty",fontSize: 35,fontWeight: FontWeight.bold),)

              ,Text(flag? BlocProvider.of<BmiCubit>(context).weight.toString(): BlocProvider.of<BmiCubit>(context).age.toString(),

                  style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold))
              ,Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){BlocProvider.of<BmiCubit>(context).decreamentButton(flag);},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(
                          color: Colors.grey
                          , offset: Offset(0, 3))],
                        borderRadius: BorderRadius.circular(60),
                      color: Colors.white,
                    ),
                      
                      child: const Icon(Icons.remove,color: Colors.black,),),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){BlocProvider.of<BmiCubit>(context).increamentButton(flag);},
                    child: Container(

                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                         color: Colors.grey
                           , offset: Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.add,color: Colors.black,),
                    ),
                  ),
                ],)
            ],),
        ),
      ),
    )
    );
  }
}
