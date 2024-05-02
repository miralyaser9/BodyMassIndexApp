
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'bmi_screen.dart';

class SplashScreen extends StatelessWidget {
  @override

List<PageViewModel> getPages=[
  PageViewModel(
    title: 'Track Your Health with BMI Buddy',
    body: 'Welcome to BMI Buddy, your personal health companion! Keep track of your body mass index (BMI) and gain valuable insights into your overall health',
    image: Image.network("https://cdn.dribbble.com/users/602420/screenshots/2977201/media/6ba8af11ae40f8fa48a292d65bafe107.jpg?resize=400x0")
  ),
    PageViewModel(
        title: 'Set Goals, Stay Motivated',
        body: 'With BMI Buddy, you can set personalized health goals and stay motivated on your wellness journey. Whether you want to lose weight, gain muscle, or maintain a healthy BMI',
        image: Image.network("https://cdni.iconscout.com/illustration/premium/thumb/man-lifting-dumbbell-in-gym-7367870-6030614.png")
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IntroductionScreen(
            pages: getPages,
            next: const Text("Next",style: TextStyle(color: Colors.purple)),
            showNextButton: true,
            skip: const Text("Skip",style: TextStyle(color: Colors.purple),),
            onSkip: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiScreen()));},
            showSkipButton: true,
            done: const Text("Done",style: TextStyle(color: Colors.purple)),
            onDone: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiScreen()));},


            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(30.0, 10.0),
              activeColor: Colors.purple,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              ),
            ),
          ),
        )
      ),
    );
  }
}
