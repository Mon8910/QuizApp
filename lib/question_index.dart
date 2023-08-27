import 'package:flutter/material.dart';

class QuestionIndex extends StatelessWidget {
  const QuestionIndex(
      {required this.questionindex
      , required this.iscorrectanswer
      , super.key});
  final int questionindex;
  final bool iscorrectanswer;
  @override
  Widget build(BuildContext context) {
    final qustionnumber=questionindex+1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: iscorrectanswer ?
      const Color.fromARGB(255, 150, 198, 241)
      :const Color.fromARGB(255, 65, 62, 84),
      borderRadius: BorderRadius.circular(100)
      ),
      child: Text(qustionnumber.toString(),style:const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 22, 2, 56)
      ),),
      

    );
  }
}
