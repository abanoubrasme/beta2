import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/QuizController.dart';
import '../../../core/decoration/Colors.dart';

class MultiChoosePlayer extends StatelessWidget {
  Color color;
  int ke;
  String answer;
  void Function()? onTap;
  QuizController quizController = Get.put(QuizController());
  MultiChoosePlayer({super.key, required this.color, required this.ke,required this.answer,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
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
              ]
          ),
          child:  Center(
              child: Text(answer,
                  style:  TextStyle(fontSize: 20,color: ColorC.white))),
        ),
      ),
    );
  }
}
