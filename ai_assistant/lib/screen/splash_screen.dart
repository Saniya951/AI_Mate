// import 'package:ai_assistant/screen/home_screen.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:ai_assistant/screen/onboarding_screen.dart';
import 'package:ai_assistant/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //this is used to give some delay to splash screen nd connecting to home screen via creating function of it
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), (){
      // if user uses app fr first time show him onboarding.dart file othervise sent him to home page
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) => 
      //     Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen()
      //   )
      // );
      // use get instead navgator
      Get.off( ()=> Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen()); //replace curent screen nd go to next
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Initailizing device size
    mq= MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        width:double.maxFinite,
        child: Column(
          children: [
            const Spacer(flex: 2), //for adding some space
            Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .1),
                child: Image.asset(
                  'assest/images/logo.png',
                  width: mq.width * .30, //40% of screen -> splash screen logo
                )
              ),
            ),
            //for adding some space
            const Spacer(),

            //for using animation on splash screen
            const CustomLoading(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}