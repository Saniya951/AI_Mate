import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {

//controller is used bcz screen is goin to update everytime
  final _c = Get.put(ChatController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Chat with me'),
      ),


      //send message field nd button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          Expanded(
            child: TextFormField(
              //bcz textfield sceen is going to update
              controller:_c.textC,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                isDense: true,
                fillColor:Colors.white,
                filled:true,
                hintText: "    Ask me anything....",
                hintStyle: TextStyle(fontSize: 13),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),),
            ),),

            const SizedBox(width:9),
    
            CircleAvatar(
              radius:25,
              backgroundColor:const Color.fromARGB(255, 0, 0, 83),
              child:IconButton(
                 onPressed: _c.askQuestion,
                icon: const Icon(Icons.send_rounded,
                  color: Colors.white,
                  size:25),
                ),),
          ],),
      ),

      body: Obx(
        ()=>ListView(
          physics:const BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding: EdgeInsets.only(top:mq.height * .02, bottom: mq.width * .02),
        children: _c.list.map((e)=>MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}