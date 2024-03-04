import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../control/creator/QuizController.dart';
import '../../../../control/RDB_Controller.dart';
import '../../../../core/decoration/Colors.dart';
import '../../../../services/myServices.dart';


class CorrectAnswerEdit extends StatelessWidget {
  String answer ;
  String answerColor ;
  int selectIndexCorrect;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  CorrectAnswerEdit({super.key, required this.answer, required this.answerColor,
    required this.selectIndexCorrect, required this.answer1,
    required this.answer2, required this.answer3, required this.answer4});
  QuizController quizController = Get.put(QuizController());
  DBQuizController dbQuizController =Get.put(DBQuizController());
  MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        builder: (quizController){
          return MaterialButton(
            child:  Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Color(int.parse(answerColor)),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(2, 4)),
                  ]),
              child:  Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(answer,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            onPressed: () {
                Get.defaultDialog(
                    title: "",
                    backgroundColor: Colors.white.withOpacity(0),
                    content:GetBuilder<QuizController>(
                        builder: (quizController){
                          return GroupButton(
                            controller: GroupButtonController(
                              selectedIndex: selectIndexCorrect,
                            ),
                            options: GroupButtonOptions(
                              selectedColor: Color(int.parse(answerColor)),
                              alignment: Alignment.center,
                              borderRadius: BorderRadius.circular(5),
                              buttonHeight: 100,
                              buttonWidth: 120,
                              textAlign: TextAlign.center,
                              textPadding: const EdgeInsets.all(5),
                            ),
                            buttons: [
                              answer1,
                              answer2,
                              answer3,
                              answer4,
                            ],
                            onSelected: (s, index, b) async {
                              switch (index) {
                                case 0:
                                  answer = answer1;
                                  answerColor = ColorC.red.value.toString();
                                  selectIndexCorrect = index;
                                  quizController.correctAnswer = quizController.answer1;
                                  quizController.answerColor = ColorC.red.value.toString();
                                  quizController.selectIndexCorrect = index;
                                  dbQuizController.updateCorrectAnswer(myServices.sharePref!.get("id_question").toString(),
                                      answerColor, selectIndexCorrect, answer);
                                  quizController.update();
                                  break;
                                case 1:
                                  answer = answer2;
                                  answerColor = ColorC.amber.value.toString();
                                  selectIndexCorrect = index;
                                  quizController.correctAnswer = quizController.answer2;
                                  quizController.answerColor = ColorC.amber.value.toString();
                                  quizController.selectIndexCorrect = index;
                                  dbQuizController.updateCorrectAnswer(myServices.sharePref!.get("id_question").toString(),
                                      answerColor, selectIndexCorrect, answer);
                                  quizController.update();
                                  break;
                                case 2:
                                  answer = answer3;
                                  answerColor = ColorC.blue.value.toString();
                                  selectIndexCorrect = index;
                                  quizController.correctAnswer = quizController.answer3;
                                  quizController.answerColor = ColorC.blue.value.toString();
                                  quizController.selectIndexCorrect= index;
                                  dbQuizController.updateCorrectAnswer(myServices.sharePref!.get("id_question").toString(),
                                      answerColor, selectIndexCorrect, answer);
                                  quizController.update();
                                  break;
                                case 3:
                                  answer = answer4;
                                  answerColor = ColorC.green.value.toString();
                                  selectIndexCorrect = index;
                                  quizController.correctAnswer = quizController.answer4;
                                  quizController.answerColor = ColorC.green.value.toString();
                                  quizController.selectIndexCorrect = index;
                                  dbQuizController.updateCorrectAnswer(myServices.sharePref!.get("id_question").toString(),
                                      answerColor, selectIndexCorrect, answer);
                                  quizController.update();
                                  break;
                              }
                              quizController.update();
                            },
                          );
                        })
                );

            },
          );
        });
  }
}


/*
Get.defaultDialog(
title: "Warning!",
titleStyle: TextStyle(color: Coloors.red,fontSize: 20),
content: const Text('       Write The ِِِAnswers First, Then Choose The Correct Answer',
style: TextStyle(),
textAlign: TextAlign.center,
),
);*/
