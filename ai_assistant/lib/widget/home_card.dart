import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return SizedBox(
      height: 170,
      child: Card(
        elevation:0,
        shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        color:const Color.fromARGB(255, 111, 169, 255).withOpacity(.2),

        // InkWell widget is highly customizable and can be used to provide visual feedback when a user taps on a widget.
        child:InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTap: homeType.onTap,
          child:Row(
              children: [
                  Padding(
                    padding: homeType.padding,
                    child: Lottie.asset('assest/animations/${homeType.animations}', width:mq.width * .30),
                  ),
                  const Spacer(),
                  Text(
                    homeType.title, 
                    style:const TextStyle(fontWeight:FontWeight.w500, fontSize:20, color: Color.fromARGB(255, 0, 0, 83)),
                    ),
                  const Spacer(flex:2),
                
              ],
          ),
        )
      ).animate().scaleX(duration:1.seconds, curve: Curves.easeIn),
    
    );
  }
}