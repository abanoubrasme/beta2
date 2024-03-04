import 'package:beta/core/decoration/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../control/creator/QuizController.dart';

class CustomButtonTime extends StatelessWidget {
   int time ;
   int selectIndexTime ;
   CustomButtonTime({super.key, required this.time, required this.selectIndexTime});
   QuizController quizController =Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        builder: (quizController){
        return  MaterialButton(
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
                      Text("$time ${" Second".tr}" ,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  )),
            ),
            onPressed: () {
              Get.defaultDialog(
                backgroundColor: Colors.white.withOpacity(0),
                title: "",
                content:  GroupButton(
                  controller: GroupButtonController(
                    selectedIndex:selectIndexTime,
                  ),
                  options: GroupButtonOptions(
                    alignment: Alignment.center,
                    borderRadius: BorderRadius.circular(5),
                    buttonHeight: 50,
                    buttonWidth: 100,
                    textAlign: TextAlign.center,
                    textPadding: const EdgeInsets.all(5),
                  ),
                  buttons:  [
                    "5 Second".tr,
                    "10 Second".tr,
                    "15 Second".tr,
                    "20 Second".tr,
                    "25 Second".tr,
                    "30 Second".tr,
                    "35 Second".tr,
                    "40 Second".tr,
                  ],
                  onSelected: (s, index, b) async {
                    switch (index) {
                      case 0:
                        time = 5;
                        selectIndexTime = index ;
                        quizController.time = 5;
                        quizController.selectIndexTime = index;
                        quizController.Update();
                        break;
                      case 1:
                        time = 10;
                        selectIndexTime = index ;
                        quizController.time = 10;
                        quizController.selectIndexTime = index;
                        quizController.Update();
                        break;
                      case 2:
                        time = 15;
                        selectIndexTime = index ;
                        quizController.time = 15;
                        quizController.selectIndexTime = index;
                        quizController.Update();
                        break;
                      case 3:
                        time = 20;
                        selectIndexTime = index ;
                        quizController.time = 20;
                        quizController.selectIndexTime = index;
                        quizController.Update();
                        break;
                      case 4:
                        time = 25;
                        selectIndexTime = index ;
                        quizController.time = 25;
                        quizController.selectIndexTime = index;
                        quizController.Update();
                        break;
                      case 5:
                        time = 30;
                        selectIndexTime = index ;
                        quizController.time = 30;
                        quizController.selectIndexTime = index;
                        quizController.Update();
                        break;
                      case 6:
                        time = 35;
                        selectIndexTime = index ;
                        quizController.time = 35;
                        quizController.selectIndexTime = index;
                        quizController.Update();
                        break;
                      case 7:
                        time = 40;
                        quizController.time = 40;
                        selectIndexTime = index ;
                        quizController.selectIndexTime = index;
                        quizController.Update();
                        break;
                    } quizController.Update();
                  },
                )
              );
            },
          );
        });
  }
}
