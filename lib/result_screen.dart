import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app1/data/question.dart';
import 'package:quiz_app1/qusetions.summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,
  required this.choosenanswer,
  required this.onrestart,
  
  });
  final void Function() onrestart;
  final List<String>choosenanswer;
  List<Map<String,Object>> getsummarydata(){
    final List<Map<String,Object>> summary=[];
    for(var i =0 ;i< choosenanswer.length;i++){
      summary.add({
        'qustion_index' :i,
        'question' : question[i].text,
        'correct_answer' :question[i].answers[0],
        'user_answer' :choosenanswer[i]
      },);
    }
    return summary ;
  }

  @override
  Widget build(context) {
    final summaryData=getsummarydata();
    final numbertotalquestion=question.length;
    final numbercorrectquestion=summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];


    }).length;
    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text('you answered $numbercorrectquestion of $numbertotalquestion questions',style:
              GoogleFonts.lato(fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold
              
             ),textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            QysetionsSummary(summaryData),
            const SizedBox(height: 30,), 
              TextButton.icon(onPressed: onrestart,
              icon:const  Icon(Icons.restart_alt),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                
              ),
               label: const Text('restart'))

            ],
        ),
      ),
    );
  }
}
