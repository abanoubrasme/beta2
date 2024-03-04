import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../control/creator/QuizController.dart';
import '../../../../core/constant/font.dart';
import '../../../../core/decoration/Colors.dart';


class CustomCorrectAnswerButton extends StatelessWidget {
   String text ;
   String answerColor ;
   int selectIndexCorrect;
   CustomCorrectAnswerButton({super.key, required this.text, required this.answerColor, required this.selectIndexCorrect});
   QuizController quizController = Get.put(QuizController());

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
                child: Text(text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        onPressed: () {
          if (
              quizController.answer1 == "" ||
              quizController.answer2 == "" ||
              quizController.answer3 == "" ||
              quizController.answer4 == "")
          {
            Get.defaultDialog(
                title: "!Warning",
                titleStyle: const TextStyle(fontFamily: Font.f1,fontSize: 23),
                content:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Write The ِِِAnswers First, Then Choose The Correct Answer".tr,
                               style: TextStyle(fontFamily: Font.f1),
                    textAlign: TextAlign.center,),
                ),);
          } else {
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
                      quizController.answer1,
                      quizController.answer2,
                      quizController.answer3,
                      quizController.answer4,
                    ],
                    onSelected: (s, index, b) async {
                      switch (index) {
                        case 0:
                          text = quizController.answer1;
                          answerColor = ColorC.red.value.toString();
                          selectIndexCorrect = index;
                          quizController.correctAnswer = quizController.answer1;
                          quizController.answerColor = ColorC.red.value.toString();
                          quizController.selectIndexCorrect = index;
                          quizController.Update();
                          quizController.update();
                          print( quizController.answerColor);
                          break;
                        case 1:
                          text = quizController.answer2;
                          answerColor = ColorC.amber.value.toString();
                          selectIndexCorrect = index;
                          quizController.correctAnswer = quizController.answer2;
                          quizController.answerColor = ColorC.amber.value.toString();
                          quizController.selectIndexCorrect = index;
                          quizController.Update();
                          quizController.update();
                          print( quizController.answerColor);
                          break;
                        case 2:
                          text = quizController.answer3;
                          answerColor = ColorC.blue.value.toString();
                          selectIndexCorrect = index;
                          quizController.correctAnswer = quizController.answer3;
                          quizController.answerColor = ColorC.blue.value.toString();
                          quizController.selectIndexCorrect= index;
                          quizController.Update();
                          quizController.update();
                          print( quizController.answerColor);
                          break;
                        case 3:
                          text = quizController.answer4;
                          answerColor = ColorC.green.value.toString();
                          selectIndexCorrect = index;
                          quizController.correctAnswer = quizController.answer4;
                          quizController.answerColor = ColorC.green.value.toString();
                          quizController.selectIndexCorrect = index;
                          quizController.Update();
                          quizController.update();
                          print( quizController.answerColor);
                          break;
                      }
                      quizController.Update();
                    },
                  );
                })
            );
          }
        },
      );
    });
  }
}


