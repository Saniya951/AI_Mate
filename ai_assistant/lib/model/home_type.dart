import 'package:ai_assistant/screen/feature/chatbot_feature.dart';
import 'package:ai_assistant/screen/feature/image_feature.dart';
import 'package:ai_assistant/screen/feature/translator_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


enum HomeType{aiChatbot, aiTranslator, aiImage}

extension MyHomeType on HomeType{
  String  get title => switch(this){
    
    HomeType.aiChatbot => 'AI Chatbot',
    HomeType.aiTranslator => 'AI Translator',
    HomeType.aiImage => 'AI Image Generator',
  };

  //animations
  String  get animations => switch(this){
    
    HomeType.aiChatbot => 'chatbot_home.json',
    HomeType.aiTranslator => 'askmeanything.json',
    HomeType.aiImage => 'imagegenerator.json',
  };

  //for padding
  EdgeInsets  get padding => switch(this){
    
    HomeType.aiChatbot => const EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
    HomeType.aiImage => EdgeInsets.zero,
  };

  VoidCallback get onTap=> switch(this){
    
    HomeType.aiChatbot => () => Get.to(() => const ChatbotFeature()),
    HomeType.aiTranslator =>()=> Get.to(()=> const TranslatorFeature()),
    HomeType.aiImage => ()=> Get.to(()=> const ImageFeature()),
  };
}