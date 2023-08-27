import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.ontap, required this.answertext, super.key});
  final String answertext;
  final void Function() ontap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.symmetric(horizontal:40,vertical: 10 ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),)
       
        
      ),
      child: Text(answertext,textAlign: TextAlign.center,),
    );
  }
}
