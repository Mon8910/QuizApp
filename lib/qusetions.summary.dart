import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app1/question_index.dart';

class QysetionsSummary extends StatelessWidget {
  const QysetionsSummary(this.summarydata, {super.key});
  final List<Map<String, Object>> summarydata;
  @override
  Widget build(context) {
    return SizedBox(height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return Padding(padding:const  EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [ QuestionIndex(questionindex: data['qustion_index']as int, 
                iscorrectanswer: data['user_answer']==data['correct_answer']),
                const SizedBox(width: 20,),
                 Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start
                    ,children: [
                    
                    Text(data['question'].toString(),style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                      ,fontSize: 16
                    ),),
                    const SizedBox(height: 5,),
                    Text(data['user_answer'].toString()),
                    Text(data['correct_answer'].toString()),
                  ],),
                )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
