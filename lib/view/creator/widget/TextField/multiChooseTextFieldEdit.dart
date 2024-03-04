import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/QuizController.dart';
import '../../../../control/RDB_Controller.dart';
import '../../../../services/myServices.dart';

class MultiChooseTextFieldEdit extends StatelessWidget {
  Color color;
  int ke;
  TextEditingController controller = TextEditingController();
  QuizController quizController = Get.put(QuizController());
  DBQuizController dbQuizController =Get.put(DBQuizController());
  MyServices myServices = Get.find();
  MultiChooseTextFieldEdit({super.key, required this.color, required this.ke,required this.controller});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 2)),
            ]),
        child: Center(
            child: TextField(
              controller: controller,
              scrollPadding: const EdgeInsets.all(10),
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.done,
              onChanged: (answer) {
              try{
                switch (ke) {
                  case 1:
                      quizController.answer1 = answer;
                      dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(), answer,"answer1");
                      quizController.update();
                    break;
                  case 2:
                    quizController.answer2 = answer;
                    dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(), answer,"answer2");
                     quizController.update();
                    break;
                  case 3:
                    quizController.answer3 = answer;
                    dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(), answer,"answer3");
                     quizController.update();
                    break;
                  case 4:
                    quizController.answer4 = answer;
                    dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(), answer,"answer4");
                    quizController.update();
                    break;
                }
              }catch(e){}
                quizController.update();
              },
              style: const TextStyle(fontSize: 20, color: Colors.white),
              cursorHeight: 25,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              maxLines: 3,
              minLines: 1,
              maxLength: 50,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.grey.shade50.withOpacity(0)),
                hintStyle:
                TextStyle(fontSize: 20, color: Colors.white.withOpacity(.5)),
                hintText: " Add Answer",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            )),
      ),
    );
  }
}
