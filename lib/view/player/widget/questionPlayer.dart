import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/QuizController.dart';

class QuestionPlayer extends StatelessWidget {
  final String question ;
  QuestionPlayer({super.key,required this.question});
  QuizController quizController =Get.put(QuizController());
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: Material.defaultSplashRadius,
      decoration: BoxDecoration(color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 2)),
          ]),
      margin: const EdgeInsets.all(10),
      child:  Center(
          child: Text(question,style: const TextStyle(fontSize: 22),)),
    );
  }
}
