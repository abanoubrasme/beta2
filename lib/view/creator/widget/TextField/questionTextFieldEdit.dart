import 'package:beta/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/QuizController.dart';
import '../../../../control/RDB_Controller.dart';
import '../../../../services/myServices.dart';

class QuestionTextFieldEdit extends StatelessWidget {
  QuestionTextFieldEdit({super.key, this.controller});
  QuizController quizController =Get.put(QuizController());
  DBQuizController dbQuizController =Get.put(DBQuizController());
  MyServices myServices = Get.find();
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (quizController){
      return TextField(
        controller: controller,
        scrollPadding: const EdgeInsets.all(10),
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.done,
        onChanged: (s) {
          quizController.question = s ;
         String question = s ;
          dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(),
              question,"question");
          quizController.update();
        },
        cursorColor: Colors.black12,
        cursorHeight: 40,
        textAlign: TextAlign.center,
        maxLines: 5,
        style: const TextStyle(fontSize: 25),
        decoration: const InputDecoration(
          hintText: "Add Question",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      );
    });
  }
}
