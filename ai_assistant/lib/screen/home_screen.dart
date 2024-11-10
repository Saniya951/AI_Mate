import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:ai_assistant/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //this will show the status nd navigator bar in home scrren
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
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

    // APIs.getAnswer('Hii');

    return Scaffold(
      appBar: AppBar(
        title:const Text(appName, style:TextStyle(fontWeight:FontWeight.w500, fontSize:20, color:Color.fromARGB(255, 253, 253, 253)),),
        elevation:1,
        centerTitle:true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 83),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right:18),
            onPressed: (){}, 
            icon: const Icon(Icons.brightness_4_outlined, color:Colors.white))],
        ),


      body: ListView(
        padding:EdgeInsets.symmetric(
          horizontal: mq.width* .04, vertical:mq.height * .02,
        ),
          //to create multiple cards of same property insted of copy paste
          children: HomeType.values.map((e)=> HomeCard(homeType: e)).toList(),
          // map method is used to convert each HomeType value into a HomeCard
        ),

      );
    
  }
}