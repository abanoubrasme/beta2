import 'package:beta/core/decoration/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../control/creator/QuizController.dart';

class ButtonTimePlayer extends StatelessWidget {
  int time ;
  ButtonTimePlayer({super.key, required this.time,});
  QuizController quizController =Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        builder: (quizController){
          return   Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110),
            child: Container(
                height: 50,
                margin:
                const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: ColorC.teal,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(2, 4)),
                    ]),
                child:  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8,),
                        Text("$time Second" ,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    )),
              ),
          );
        });
  }
}
