import 'package:beta/view/creator/Screen/pageQuizzes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../control/creator/QuizController.dart';
import '../../../control/RDB_Controller.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../core/decoration/Colors.dart';
import '../../../main.dart';
import '../../../services/myServices.dart';

class PageOfQuiz extends StatelessWidget {
   PageOfQuiz({super.key});
   DBQuizController dbQuizController =Get.put(DBQuizController());
   QuizController quizController =Get.put(QuizController());
   MyServices myServices = Get.find();
   NameOfQuizController nameOfQuizController =Get.put(NameOfQuizController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: ColorC.teal,
        title:  Text(nameOfQuizController.name,style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                quizController.question = "";
                quizController.answer1  = "";
                quizController.answer2  = "";
                quizController.answer3  = "";
                quizController.answer4  = "";
                quizController.correctAnswer = "Select the Correct answer";
                quizController.time = 5;
                quizController.selectIndexTime = 8 ;
                quizController.selectIndexCorrect = 5 ;
                quizController.answerColor = ColorC.teal.value.toString();
                quizController.update();
                Get.toNamed("/quiz");
              },
              icon: const Icon(Icons.add),
              iconSize: 30,
          )],
         leading: IconButton(icon: const Icon(Icons.arrow_back_outlined),
          color: Colors.white,
          onPressed: () {
            Get.to(()=> PageOfQuizzes());
          },),
      ),
        body: FutureBuilder(
              future: dbQuizController.getQuiz(
                  myServices.sharePref!.get("id_user").toString(),
                  myServices.sharePref!.get("idQuiz").toString()),
              builder: (BuildContext context,AsyncSnapshot snapshot) {
                if(!snapshot.hasData){
                  return  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 150,
                            width: 150,
                            child: Image(image: AssetImage('image/notebook.png'))),
                        SizedBox(height: 90,)
                      ],
                    ),
                  );
                }
                if(snapshot.hasError){
                  return const Center(child: CircularProgressIndicator());
                }
                else{
                  return GetBuilder<QuizController>(
                  builder: (quizController){
                    return  ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, index){
                      quizController.question = snapshot.data['data'][index]["question"];
                      return InkWell(
                        onTap: (){

                            quizController.question = snapshot.data['data'][index]["question"];
                            myServices.sharePref!.setString("question", snapshot.data['data'][index]["question"]);
                            myServices.sharePref!.setString("id_question", snapshot.data['data'][index]["id_question"].toString());
                            quizController.update();


                          Get.toNamed("/editQuiz");
                        },
                        child: Card(
                          child: Dismissible(
                              movementDuration: const Duration(milliseconds: 1000),
                              resizeDuration: const Duration(milliseconds: 1000),
                              background: slideRightBackground(),
                              secondaryBackground: slideLeftBackground(),
                              key: Key( snapshot.data.toString()),
                              onDismissed: (direction) {},
                              confirmDismiss: (direction) async {
                                if (direction == DismissDirection.endToStart) {
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: const Text("Are you sure you want to delete this quiz?"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text("Cancel", style: TextStyle(color: Colors.black),),
                                              onPressed: () {
                                                Get.back(); },),
                                            TextButton(
                                              child: const Text("Delete",style: TextStyle(color: Colors.red),),
                                              onPressed: () {},),],);
                                      });}
                              },
                              child: Row(children: [
                                Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: ColorC.teal,
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10))
                                    ),
                                    child: Center(child: Text("${index+1}",
                                      style: const TextStyle(fontSize: 30,color: Colors.white),))
                                ),
                                Padding(
                                    padding:  EdgeInsets.only(left: 25,),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${snapshot.data['data'][index]["question"]}",style: TextStyle(fontSize: 20),),
                                        SizedBox(height: 5,),
                                      ],
                                    ))
                              ],)
                          ),
                        ),
                      );
                    } ,
                  );});
                }
              },
            )



    );
  }
}
Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: const Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 20,),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text("Edit",
            // " ${getLang(context, "Edit")}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}
Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text("Delete",
            //  " ${getLang(context, "Delete")}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}