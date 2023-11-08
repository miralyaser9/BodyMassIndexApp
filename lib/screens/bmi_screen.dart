import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  double sliderValue=160;
  int weight=60;
  int age=25;
  bool isMale=true;
  var bmi=0;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.black87,
      appBar: AppBar(title: const Text("Bmi Calculator",style: TextStyle(fontFamily: "frosty",fontSize: 35,color: Colors.white),),
        centerTitle: true,backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              customExpanded(ic: Icons.male,gender:"Male",cl: isMale?Colors.blue:Colors.greenAccent,ontabb: (){isMale=!isMale;setState(() {

              });}),
              const SizedBox(width: 10,),
              customExpanded(ic: Icons.female,gender: "Female",cl: isMale?Colors.greenAccent:Colors.pink,ontabb: (){isMale=!isMale;setState(() {

              });}),
            ],),
            const SizedBox(height: 20,),

            customExpanded_3(value: "180"),
            const SizedBox(height: 20,),

            Row(
              children: [customExpanded_2(name: "Weight",value: weight.toString(),flag: true),
                const SizedBox(width: 10,),
                customExpanded_2(name: "Age",value: age.toString(),flag: false)

              ],
            ),
            const SizedBox(height: 20,),
            Container(width: double.infinity,height: 50,
              child: ElevatedButton(onPressed: (){

                bmi=(weight  / ((sliderValue  / 100) * (sliderValue  / 100))) .round();
                setState(() {

                });
              }, child: const Text("Calculate",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,fontFamily: "frosty"),),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink)),

              ),
            ),
            Text("Your Body Mass Index  is $bmi kg/m2 "
              ,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent,fontSize: 21),)

          ],
          ),
        ),
      ),

    );
  }
  customExpanded({var ic,var gender,var cl,required void Function() ontabb}){
    return Expanded(
        child: GestureDetector(
          onTap: ontabb,
          child: Container(
            decoration: BoxDecoration(
                color:cl,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
                boxShadow:const [BoxShadow(color: Colors.white24,offset:Offset(5,7))] ),
            child: Center(
              child: Column(children: [
                Icon(ic,size: 90,),Text(gender,style: const TextStyle(fontSize: 37,fontWeight: FontWeight.bold,fontFamily: "frosty"),)
              ],),
            ),
          ),
        )
    );
  }
  customExpanded_2({var name,var value,required bool flag}){
    return Expanded(child: Container(decoration:
    BoxDecoration(boxShadow:const [BoxShadow(color: Colors.white24,offset:Offset(5,5))],color: Colors.yellowAccent,borderRadius: BorderRadius.circular(16)),
      child:
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,style: const TextStyle(fontFamily: "frosty",fontSize: 35,fontWeight: FontWeight.bold),)

            ,Text(flag?weight.toString():age.toString(),

                style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold))
            ,Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: (){
                  flag?weight--:age--;
                  setState(() {

                  });



                },mini: true,child: const Icon(Icons.remove),),
                const SizedBox(width: 10,),
                FloatingActionButton(onPressed: (){
                  flag?weight++:age++;
                  setState(() {

                  });

                },mini: true,child: const Icon(Icons.add),),

              ],)
          ],),
      ),
    )
    );
  }
  customExpanded_3({var value,}){
    return  Container(
      decoration: BoxDecoration(boxShadow:const [BoxShadow(color: Colors.white24,offset:Offset(5,10))],color: Colors.cyanAccent,borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text("Height",style: TextStyle(fontFamily: "frosty",fontSize: 40,fontWeight: FontWeight.bold),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(sliderValue.round().toString()
                    ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)
                  ,const Text("cm",style: TextStyle(fontSize: 25),)],)
              ,
              Slider(
                  value: sliderValue,
                  max: 250,
                  min: 0,
                  onChanged: (changedValue){
                    sliderValue=changedValue;
                    setState(() {

                    });

                  }
              )
            ],),
        ),
      ),

    );
  }

}