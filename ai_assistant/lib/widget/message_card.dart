import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:typewrite_text/typewrite_text.dart';

 class MessageCard extends StatelessWidget {

  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r =  Radius.circular((15));

    return message.msgType==MessageType.bot ? 
    //for bot
    Row(
      children:[

        const SizedBox(width:8),

        CircleAvatar(
          backgroundColor:const Color.fromARGB(255, 218, 218, 218),
          radius:20,
          child: Image.asset('assest/images/logo.png',width:25),

        ),
        Container(
          constraints: BoxConstraints(maxWidth: mq.width *.6), //accd length of text it will manage boxs width
          margin: EdgeInsets.only(bottom: mq.height * .02, left: mq.width *.02),
            padding: EdgeInsets.symmetric(vertical: mq.height * .01, horizontal: mq.width * .03),
              decoration:BoxDecoration(
                border:Border.all(color:const Color.fromARGB(255, 0, 0, 83)),
                borderRadius: const BorderRadius.only(topLeft:r, topRight: r,bottomRight: r),
              ),
              child: message.msg.isEmpty ? const TypewriteText(
                  linesOfText: ['Please Wait...'],
                  textStyle: TextStyle(color: Color.fromARGB(255, 39, 39, 39), fontSize: 14, fontWeight: FontWeight.w400),
                  reverseAnimationDuration: Duration(milliseconds: 0),
                  beforeAnimationDuration: Duration(milliseconds: 100),
                  needCursor: false,
                ) : Text(message.msg,)
          )
      ]
    ) : 
    //for user
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:[
        Container(
          constraints: BoxConstraints(maxWidth: mq.width *.6), //accd length of text it will manage boxs width
          margin: EdgeInsets.only(bottom: mq.height * .02, right: mq.width *.02),
            padding: EdgeInsets.symmetric(vertical: mq.height * .01, horizontal: mq.width * .03),
              decoration:BoxDecoration(
                border:Border.all(color:const Color.fromARGB(255, 0, 0, 83)),
                borderRadius: const BorderRadius.only(topLeft:r, topRight: r,bottomLeft: r),
              ),
              child: Text(message.msg
              ),
        ),

        const CircleAvatar(
          radius:20,
          backgroundColor:Color.fromARGB(255, 218, 218, 218),
          child:Icon(Icons.person, color:Color.fromARGB(255, 0, 0, 83),)
        ),

        const SizedBox(width:8),

      ]);
  }
}