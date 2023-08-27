import 'package:flutter/material.dart';
import 'package:quiz_app1/data/question.dart';
import 'package:quiz_app1/question_screen.dart';
import 'package:quiz_app1/result_screen.dart';
import 'package:quiz_app1/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
   return _QuizState() ; 
  }
}

class _QuizState extends State<Quiz>{
  
  var activescreen='start-screen';
   List<String> selectedanswer=[];
  void switchsreen(){
    setState(() {
      activescreen='question-screen';
    });
   
  }
  void chooseanswer(String answer){
    selectedanswer.add(answer);
    if(selectedanswer.length==question.length){
      setState(() {
        
        activescreen='result-screen';
      });
    }

  }
  void restartedscreen (){
    setState(() {
      selectedanswer=[];
      //is very important
      activescreen='question-screen';
    });
  }
 
@override
  Widget build(context) {
   Widget screenwidget=StartScreen(switchsreen);
   if(activescreen=='question-screen'){
    screenwidget=  QuestionScreen(onselectedanswer: chooseanswer,);
   }
   if(activescreen=='result-screen'){
    screenwidget= ResultScreen(choosenanswer: selectedanswer,onrestart:restartedscreen ,);
   }
   return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child:screenwidget
          //activescreen=='start-screen'?
          //StartScreen(switchsreen):
         //const  QuestionScreen()
          ,
        ),
      ),
    );
  }

}