import 'package:beta/control/player/playerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/RDB_Controller.dart';
import '../../../control/creator/nameQuizController.dart';

class CodeCheckTextField extends StatelessWidget {
  CodeCheckTextField({super.key, required this.val});
  NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
  DBQuizController dbQuizController = Get.put(DBQuizController());
  PlayerController playerController = Get.put(PlayerController());
  final String? Function(String? s) val;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: val,
        maxLength: 6,
        cursorColor: Colors.grey[700],
        cursorWidth: 3,
        cursorHeight: 28,
        style: TextStyle(
          shadows: [
            Shadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7,
              offset: const Offset(0 , 3),
            )
          ],
          fontSize: 20,
        ),
        strutStyle: const StrutStyle(
          leading: .5,
        ),
        onChanged: (code) {
          nameOfQuizController.codeC.text=code;
          playerController.code = int.parse(code) ;
        },
        decoration:  const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gapPadding: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black45),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          labelText: "  Enter The Code",
          alignLabelWithHint: true,
          labelStyle: TextStyle(letterSpacing: 1, color: Colors.black45,fontSize: 18,),
        ),
      ),
    );
  }
}