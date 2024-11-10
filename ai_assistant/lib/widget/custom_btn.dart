import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15) ,), 
              backgroundColor:const Color.fromARGB(255, 0, 0, 83),
              foregroundColor: Colors.white,
              minimumSize: Size(mq.width * .5, 40)),
            onPressed:onTap,
            // now to change text within button to next nd finish accd to page
            child: Text(text)
            ),
    );
  }
}