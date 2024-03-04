import 'dart:async';
import 'package:beta/view/player/widget/buttonTimePlayer.dart';
import 'package:beta/view/player/widget/multiChoosePlayer.dart';
import 'package:beta/view/player/widget/questionPlayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/QuizController.dart';
import '../../../../control/RDB_Controller.dart';
import '../../../../control/creator/nameQuizController.dart';
import '../../../../core/decoration/Colors.dart';
import '../../../control/player/playerController.dart';
import '../../../services/myServices.dart';
import '../widget/rankBox.dart';

class Player extends StatelessWidget {
  Player({super.key});

  QuizController quizController =Get.put(QuizController());
  DBQuizController dbQuizController =Get.put(DBQuizController());
  NameOfQuizController nameOfQuizController =Get.put(NameOfQuizController());
  PlayerController playerController = Get.put(PlayerController());
  MyServices myServices = Get.find();
 int next = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
                backgroundColor: ColorC.teal,
                centerTitle: true,
                title: Text(playerController.name),
                actions: [
                  MaterialButton(
                      onPressed: (){
                      },
                      child:  const Text("Save",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                ],
              ),
        body:FutureBuilder(
            future: dbQuizController.getQuiz(
                myServices.sharePref!.get("id_user").toString(),
              myServices.sharePref!.get("idQuiz").toString()),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              playerController.content=[];
              playerController.next = 0;

              int len =snapshot.data?["data"].length?? 0;
              playerController.totalRank = len;
              if(playerController.content.isEmpty){
                for(int i =0;i<len;i++){
                  playerController.content.add(snapshot.data["data"][i]["id_question"]);
                }
              }

              if(!snapshot.hasData){
                return  const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 150,
                          width: 150,
                          child: Image(image: AssetImage('image/notebook.png'))),
                      SizedBox(height: 18,),
                      Text("you have no data",style: TextStyle(fontSize: 18,fontFamily: 'ProtestStrike'),),
                      SizedBox(height: 50,),
                    ],
                  ),
                );
              }
              if(snapshot.hasError){
                return  const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 150,
                          width: 150,
                          child: Image(image: AssetImage('image/notebook.png'))),
                      SizedBox(height: 18,),
                      Text("you have an error",style: TextStyle(fontSize: 18,fontFamily: 'ProtestStrike'),),
                      SizedBox(height: 50,),
                    ],
                  ),
                );
              }
              else{
               return GetBuilder<PlayerController>(
                   builder: (playerController){
                     return PageView.builder(
                       itemCount: 1,
                       itemBuilder: (context,index){
                          Timer(
                           Duration(seconds: snapshot.data["data"][playerController.next]['time']),
                               () {
                                 if(playerController.next<playerController.content.length-1){
                                   playerController.next++;
                                   playerController.update();
                                 }else{
                                   Get.toNamed("/home");
                                   playerController.next = 0;
                                 }
                           },

                         );
                         return ListView(
                           children: [
                             Center(
                               child: ButtonTimePlayer(
                                 time:snapshot.data["data"][playerController.next]['time'],
                               ),
                             ),
                             QuestionPlayer(
                               question: snapshot.data["data"][playerController.next]['question'],),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: [
                                   Row(
                                     children: [
                                       MultiChoosePlayer(
                                         color: ColorC.red,
                                         ke:1,
                                         answer: snapshot.data["data"][playerController.next]['answer1'],
                                         onTap: () {
                                           playerController.choose=snapshot.data["data"][playerController.next]['answer1'];
                                           if(playerController.choose==snapshot.data["data"][playerController.next]['correct_answer']){
                                             playerController.rank++;
                                           }
                                           if(playerController.next<playerController.content.length-1){
                                             playerController.next++;
                                           }else{
                                             Get.toNamed("/finalScore");
                                             playerController.next = 0;
                                           }

                                           playerController.update();

                                         },),
                                       MultiChoosePlayer(
                                         color: ColorC.amber,
                                         ke:2, answer: snapshot.data["data"][playerController.next]['answer2'],
                                         onTap: () {
                                           playerController.choose=snapshot.data["data"][playerController.next]['answer2'];
                                           if(playerController.choose==snapshot.data["data"][playerController.next]['correct_answer']){
                                             playerController.rank++;
                                           }
                                           if(playerController.next<playerController.content.length-1){
                                             playerController.next++;
                                           }
                                           else{
                                             Get.toNamed("/finalScore");
                                             playerController.next = 0;
                                           }
                                           playerController.update();
                                         },),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       MultiChoosePlayer(color:ColorC.blue,ke: 3,
                                         answer: snapshot.data["data"][playerController.next]['answer3'],
                                         onTap: () {
                                           playerController.choose=snapshot.data["data"][playerController.next]['answer3'];
                                           if(playerController.choose==snapshot.data["data"][playerController.next]['correct_answer']){
                                             playerController.rank++;
                                           }
                                           if(playerController.next<playerController.content.length-1){
                                             playerController.next++;
                                           }else{
                                             Get.toNamed("/finalScore");
                                             playerController.next = 0;
                                           }

                                           playerController.update();
                                         },),
                                       MultiChoosePlayer(color : ColorC.green,ke:4,
                                         answer: snapshot.data["data"][playerController.next]['answer4'],
                                         onTap: () {
                                           playerController.choose=snapshot.data["data"][playerController.next]['answer4'];
                                           if(playerController.choose==snapshot.data["data"][playerController.next]['correct_answer']){
                                             playerController.rank++;
                                           }
                                           if(playerController.next<playerController.content.length-1){
                                             playerController.next++;
                                           }else{
                                             Get.toNamed("/finalScore");
                                             playerController.next = 0;
                                           }

                                           playerController.update();
                                         },),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(bottom: 12,right: 15,left: 15,top: 7),
                               child: Row(
                                 children: [
                                   RankBox(rank: playerController.rank, text: 'ٍScore',),
                                   const SizedBox(width: 15,),
                                   RankBox(rank: playerController.totalRank, text: 'Rank',),]
                               )
                             )
                           ],
                         );

                       },
                     );
                   });

              }

        })
            );


  }
}
