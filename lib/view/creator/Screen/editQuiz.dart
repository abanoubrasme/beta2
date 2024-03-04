import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/QuizController.dart';
import '../../../control/RDB_Controller.dart';
import '../../../control/creator/editQuizController.dart';
import '../../../core/decoration/Colors.dart';
import '../../../services/myServices.dart';
import '../widget/Button/correctAnswerButtonEdit.dart';
import '../widget/Button/customButtonTimeEdit.dart';
import '../widget/TextField/multiChooseTextFieldEdit.dart';
import '../widget/TextField/questionTextFieldEdit.dart';

class EditQuiz extends StatelessWidget {
   EditQuiz({super.key});
   EditQuizController editQuizController =Get.put(EditQuizController());
   DBQuizController dbQuizController =Get.put(DBQuizController());
   QuizController quizController =Get.put(QuizController());
   MyServices myServices = Get.find();
   @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                backgroundColor: ColorC.teal,
                centerTitle: true,
                title: const Text(""),
                leading: IconButton(
                  onPressed: () async{
                    quizController.update();
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_outlined) ,
                ),
                actions: [
                  MaterialButton(
                      onPressed: () {

                          dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(),
                              quizController.questionE.text,"question");
                          dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(),
                              quizController.answer1E.text,'answer1');
                          dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(),
                              quizController.answer2E.text,'answer2');
                          dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(),
                              quizController.answer3E.text,'answer3');
                          dbQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(),
                              quizController.answer4E.text,'answer4');
                        quizController.update();
                        Get.toNamed("pageOfQuiz");
                      },
                      child:   Text("Save".tr,
                        style: const TextStyle(color: Colors.white, fontSize: 17),
                      )),
                ],
              ),
              body: FutureBuilder(
                     future: dbQuizController.getData2(myServices.sharePref!.get("question").toString()),
                     builder: (BuildContext context, AsyncSnapshot snapshot) {
                             WidgetsBinding.instance.addPostFrameCallback((_){
                               quizController.questionE.text = snapshot.data?["data"][0]['question'] ?? "";
                               quizController.answer1E.text = snapshot.data?['data'][0]['answer1'] ?? "";
                               quizController.answer2E.text = snapshot.data?['data'][0]['answer2'] ?? "";
                               quizController.answer3E.text = snapshot.data?['data'][0]['answer3'] ?? "";
                               quizController.answer4E.text = snapshot.data?['data'][0]['answer4'] ?? "";
                               quizController.correctAnswer = snapshot.data?['data'][0]['correct_answer'] ?? "";
                               quizController.time = snapshot.data?['data'][0]['time'] ?? 5;
                               quizController.selectIndexTime = snapshot.data?['data'][0]['index_time'] ?? 0;
                               quizController.answerColor = snapshot.data?['data'][0]['color'] ?? Colors.teal.value.toString();
                               quizController.selectIndexCorrect = snapshot.data?['data'][0]['index_color'] ?? 0;
                               quizController.update();
                             });
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator(color: Colors.teal,));
                          }
                          if (snapshot.hasError) {
                            return const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: Image(image: AssetImage(
                                          'image/notebook.png'))),
                                  SizedBox(height: 90,)
                                ],
                              ),
                            );
                          }
                          else {
                           // quizController.update();
                            return GetBuilder<QuizController>(
                            builder: (quizController) {
                               return   ListView(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomButtonTimeEdit(
                                          time: quizController.time,
                                          selectIndexTime: quizController.selectIndexTime),
                                    ),
                                    Expanded(
                                      child: CorrectAnswerEdit(
                                        answer: quizController.correctAnswer,
                                        answerColor: quizController.answerColor,
                                        selectIndexCorrect: quizController.selectIndexCorrect,
                                        answer1: quizController.answer1E.text,
                                        answer2: quizController.answer2E.text,
                                        answer3: quizController.answer3E.text,
                                        answer4: quizController.answer4E.text,)

                                      ,)
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
                                      child: QuestionTextFieldEdit(
                                          controller: quizController.questionE)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          MultiChooseTextFieldEdit(
                                            color: ColorC.red,
                                            ke: 1,
                                            controller: quizController.answer1E,
                                          ),
                                          MultiChooseTextFieldEdit(
                                            color: ColorC.amber,
                                            ke: 2,
                                            controller: quizController.answer2E,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          MultiChooseTextFieldEdit(
                                            color: ColorC.blue,
                                            ke: 3,
                                            controller: quizController.answer3E,
                                          ),
                                          MultiChooseTextFieldEdit(
                                            color: ColorC.green,
                                            ke: 4,
                                            controller: quizController.answer4E,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );});
                          }
                        },)

     );
   }
  }

