import 'package:flutter/material.dart';
import 'package:quiz_app1/answer_button.dart';
import 'package:quiz_app1/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({required this.onselectedanswer,super.key});
  final void Function(String answer) onselectedanswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }

}
class _QuestionScreenState extends State<QuestionScreen>{
  var currentquestionindex=0;
  void answerqusetion(String selectanswer){
    widget.onselectedanswer(selectanswer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build( context) {
    final currentquestion=question[currentquestionindex];
   return  SizedBox(
    width: double.infinity,
     child: Container(
      margin: const EdgeInsets.all(40),
       child: Column(mainAxisAlignment: MainAxisAlignment.center
       ,crossAxisAlignment: CrossAxisAlignment.stretch
       ,children: [
         Text(currentquestion.text,
         style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold
         ),
        textAlign: TextAlign.center,),
        const SizedBox(height: 30,),
        ...currentquestion.getshuffledanswer().map((answer){
          return AnswerButton(ontap: (){
            answerqusetion(answer);
          }
          , answertext: answer);
        }),    
       ],),
     ),
   )
  ;}
}