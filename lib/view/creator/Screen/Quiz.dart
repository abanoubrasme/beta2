import 'package:beta/view/creator/Screen/pageQuiz.dart';
import 'package:beta/view/creator/widget/TextField/multiChosseTextFeild.dart';
import 'package:beta/view/creator/widget/TextField/questionTextField.dart';
import 'package:beta/view/creator/widget/Button/customButtonTime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/QuizController.dart';
import '../../../control/RDB_Controller.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../core/decoration/Colors.dart';
import '../../../main.dart';
import '../../../services/myServices.dart';
import '../widget/Button/correctAnswerButton.dart';

class Quiz extends StatelessWidget {
   Quiz({super.key});

   QuizController quizController =Get.put(QuizController());
   DBQuizController dbQuizController =Get.put(DBQuizController());
   NameOfQuizController nameOfQuizController =Get.put(NameOfQuizController());
   MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorC.teal,
        centerTitle: true,
        title: const Text(""),
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child:  Text("Cancel".tr,
            //"${getLang(context, "Cancel")}",
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        leadingWidth: 80,
        actions: [
          MaterialButton(
              onPressed: () async{
                dbQuizController.insertData(myServices.sharePref!.get("id_user").toString(),myServices.sharePref!.get("idQuiz").toString());
                Get.toNamed("/pageOfQuiz");
              },
              child:   Text("Save".tr,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              )),
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomButtonTime(
                  time: quizController.time,
                  selectIndexTime: quizController.selectIndexTime,),
              ),
              Expanded(
                child:  CustomCorrectAnswerButton(
                  text: quizController.correctAnswer.tr,
                  answerColor: quizController.answerColor,
                  selectIndexCorrect: quizController.selectIndexCorrect,),)
            ],
          ),
          Container(
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
            child: Center(
                child: QuestionTextField()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    multiChooseTextField( color: ColorC.red, ke:1,),
                    multiChooseTextField(color: ColorC.amber,ke:2),
                  ],
                ),
                Row(
                  children: [
                    multiChooseTextField(color:ColorC.blue,ke: 3,),
                    multiChooseTextField(color : ColorC.green,ke:4),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );

  }
}
