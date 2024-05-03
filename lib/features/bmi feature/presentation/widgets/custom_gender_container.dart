import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGenderContainer extends StatelessWidget {
  const CustomGenderContainer({super.key, required this.icon, required this.iconTitle, required this.color, required this.ontabb});
   final IconData icon;
   final String iconTitle;
   final Color color;
  final void Function() ontabb;


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: ontabb,
          child: Container(
            decoration: BoxDecoration(
                color:color,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
                boxShadow: const [BoxShadow(color: Colors.white24,offset:Offset(5,7))] ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Icon(icon ,size: 90,),
                  Text(iconTitle,style: const TextStyle(fontSize: 37,fontWeight: FontWeight.bold,fontFamily: "frosty"),)
                ],),
              ),
            ),
          ),
        )
    );;
  }
}
