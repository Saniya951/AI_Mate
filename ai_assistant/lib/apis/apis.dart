import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:ai_assistant/helper/global.dart';
import 'package:http/http.dart'as http;

class APIs{
  //get answers from chatgpt
  static Future<String> getAnswer(String question) async{
    try{
      final res = 
        await http.post(Uri.parse('https://api.openai.com/v1/chat/completions'), 
            headers:{
              HttpHeaders.contentTypeHeader : 'application/json',
              HttpHeaders.authorizationHeader: 'Bearer $apiKey'
            }, 
            
            body:jsonEncode({
                "model": "gpt-3.5-turbo-0125",
                "temperature": 0,
                "max_tokens":2000,
                "messages": [
                  { "role": "user", "content": question},
                ] 
            })
            );

            final data = jsonDecode(res.body);
 
      log('res: $data');
      return data['choices'][0]['message']['content'];

    }catch(e){
      log('getAnswerE: $e');
      return 'Something went wrong';

    }
  }
}