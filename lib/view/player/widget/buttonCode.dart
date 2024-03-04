
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/RDB_Controller.dart';
import '../../../core/decoration/Colors.dart';

class ButtonCode extends StatelessWidget {
  ButtonCode({super.key,required this.onPressed});
  DBQuizController dbQuizController = Get.put(DBQuizController());
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorC.teal),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0),
        ),
        margin:  const EdgeInsets.all(15),
        child: TextButton(
            onPressed: onPressed,
            child: Text("Connect", style: TextStyle(fontSize: 24, color: ColorC.teal,fontFamily: 'ProtestStrike'),
            )));
  }
}