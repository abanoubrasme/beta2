import 'package:beta/view/player/widget/buttonCode.dart';
import 'package:beta/view/player/widget/textFieldNamePlayer.dart';
import 'package:beta/view/player/widget/textFieldCode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/RDB_Controller.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../core/decoration/Colors.dart';

class CodeOfQuiz extends StatelessWidget {
   CodeOfQuiz({super.key});

  DBQuizController dbQuizController = Get.put(DBQuizController());
  NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorC.teal.withOpacity(.5),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 90),
                  child: Column(
                    children: [
                      const Text('BeTa',style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                          fontFamily:"Water_Brush" ),),
                      const SizedBox(height: 20,),
                      GetBuilder<DBQuizController>(
                          builder: (dbQuizController){
                            return  Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.all(10),
                              height: 380,
                              width: 315,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20,),
                                  NamePlayerTextField(),
                                  CodeCheckTextField(
                                    val: (code) {
                                      return dbQuizController.validatorName(code!, 6, 4);
                                    },),
                                  ButtonCode(
                                    onPressed: () {
                                      dbQuizController.getCodeCheck(nameOfQuizController.codeC.text);
                                    },)
                                ],
                              ),
                            );
                          }),
                    ],
                  ),

              ),
            ),
          ],
        )

    );
  }
}
