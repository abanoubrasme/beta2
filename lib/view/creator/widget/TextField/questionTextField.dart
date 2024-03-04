import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/QuizController.dart';

class QuestionTextField extends StatelessWidget {
   QuestionTextField({super.key, this.controller});
  QuizController quizController =Get.put(QuizController());
   TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        scrollPadding: const EdgeInsets.all(10),
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.done,
        onChanged: (s) {
          quizController.question = s ;
          print( quizController.question);
        },
        cursorColor: Colors.black12,
        cursorHeight: 40,
        textAlign: TextAlign.center,
        maxLines: 5,
        style: const TextStyle(fontSize: 25),
        decoration:  InputDecoration(
          hintText: "Add Question".tr,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
    ),
    );
  }
}
