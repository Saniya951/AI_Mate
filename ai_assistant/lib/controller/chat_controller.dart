import 'package:ai_assistant/model/message.dart';
import 'package:ai_assistant/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
  final textC=TextEditingController();

  final scrollC = ScrollController();

  final list = <Message>[
    Message(msg: 'Hello! How can I assist you today?', msgType:MessageType.bot)
  ].obs;

  Future<void> askQuestion() async{
    if(textC.text.trim().isNotEmpty){
      //user
      list.add(Message(msg: textC.text, msgType:MessageType.user));
      list.add(Message(msg: 'Please Wait!', msgType: MessageType.bot));
      _scrollDown();
      
      final res = await APIs.getAnswer(textC.text);

      //bot
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();

      textC.text='';
    }
  }


  // for moving to the end of the screen after texts increases
  void _scrollDown(){
    scrollC.animateTo(scrollC.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

}