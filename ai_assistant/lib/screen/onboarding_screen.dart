import 'package:ai_assistant/model/onboard.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:ai_assistant/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // now to make next nd prevooius buttn work use pagecontroller
    final c = PageController();

    // build object of file onboard.dart
    final list = [
      //Onboard 1
      Onboard(
        title: "Ask Me Anything", 
        subtitle: 'I can be your friend, you can ask me anything u want!', 
        animations: 'askmeanything'),
      
      //onboard2
      Onboard(
        title: 'AI-Driven Visualizations', 
        subtitle: 'Transforming your words into stunning visuals.', 
        animations: 'imagegenerator'),

      ];
 

    return Scaffold(
      // The PageView widget in Flutter is used to create a scrollable list of pages that can be swiped horizontally.
      body: PageView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, ind){
          final isLast = ind == list.length -1;

        return  Column(
        children: [
        Lottie.asset('assest/animations/${list[ind].animations}.json',
        height: mq.height * .6 ,
        width: isLast ? mq.width * .8 :null),

        Text(
          list[ind].title, //'Ask Me Anything'
          style:const TextStyle(fontSize:18,fontWeight:FontWeight.w900, letterSpacing: .4 ),
          ),

        //for some space
        SizedBox(height: mq.height *.01,),

        //subline
        SizedBox(
          width: mq.width * .7,
          child: Text(
            list[ind].subtitle, //'I can be your friend, you can ask me anything u want!', 
            textAlign: TextAlign.center,
            style:const TextStyle(fontSize:13 ,letterSpacing: .5, color:Colors.grey),
            ),
        ),

        const Spacer(),

        // dots
        Wrap(
          spacing: 10, 
          children: List.generate(
            list.length ,//2
            (i) => Container(
              // if that particualr page isi active then increse lengt of dots
              width: i == ind ? 20:10,
              height: 10,
              decoration: BoxDecoration(
                color: i == ind ? const Color.fromARGB(255, 127, 213, 253) : Colors.grey, 
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              )),
        ),

        const Spacer(),      

        // button
        CustomBtn(onTap:(){ 
          if (isLast)
            {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomeScreen()));
              // use get instead of navigator
              Get.off( ()=> const HomeScreen() );
            }else{
              // if its not last page
              c.nextPage(duration:const Duration(milliseconds: 600), curve: Curves.ease);
            }
          }, text:isLast ? 'Done' : 'Next'),
        
      const Spacer(flex:1),
    ],
    );

      }),
    );
  }
}