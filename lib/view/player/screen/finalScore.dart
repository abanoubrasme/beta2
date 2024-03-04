import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/player/playerController.dart';
import '../../../core/constant/font.dart';
import '../../../core/decoration/Colors.dart';

class FinalScore extends StatelessWidget {
   FinalScore({super.key});

  PlayerController playerController = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
      Timer(
       const Duration(seconds: 5),
          () {
              Get.toNamed("/home");
              playerController.next = 0;
              playerController.rank = 0;
              playerController.totalRank=0;
              playerController.name = "" ;
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200,),
           Text("${playerController.name}",style: TextStyle(fontSize: 35,fontFamily: Font.f1,color: ColorC.teal),),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 120,),
              Text("Score :  ",style: TextStyle(fontSize: 35,fontFamily: Font.f1,color: ColorC.teal)),
              Text("${playerController.rank}",style: TextStyle(fontSize: 30,fontFamily: Font.f1,color: ColorC.teal)),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 80,),
              Text("Final Score :  ",style: TextStyle(fontSize: 35,fontFamily: Font.f1,color: ColorC.teal)),
              Text("${playerController.totalRank}",style: TextStyle(fontSize: 30,fontFamily: Font.f1,color: ColorC.teal)),
            ],
          ),
        ],),
      ),
    );
  }
}
