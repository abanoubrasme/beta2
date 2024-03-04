import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/decoration/Colors.dart';

class EditQuizController extends GetxController{
  String question = "";
  String answer1  = "";
  String answer2  = "";
  String answer3  = "";
  String answer4  = "";
  String correctAnswer = "Select the Correct answer";
  int time = 5;
  int selectIndexTime = 8 ;
  int selectIndexCorrect = 5 ;
  String answerColor = ColorC.teal.value.toString();
  TextEditingController questionE =TextEditingController();
  TextEditingController answer1E =TextEditingController();
  TextEditingController answer2E =TextEditingController();
  TextEditingController answer3E =TextEditingController();
  TextEditingController answer4E =TextEditingController();
  String correctAnswerE = "Select the Correct answer";
  int timeE = 5;
  int selectIndexTimeE = 8 ;
  int selectIndexCorrectE = 5 ;
  String answerColorE = ColorC.teal.value.toString();

  Update(){
    selectIndexTime ;
    time ;
    selectIndexCorrect;
    correctAnswer;
    answerColor;
    question;
    answer1;
    answer2;
    answer3;
    answer4;
    questionE;
    answer1E;
    answer2E;
    answer3E;
    answer4E;
    update();
  }
}