import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/RDB_Controller.dart';
import '../../../../control/creator/nameQuizController.dart';
import '../../../../core/decoration/Colors.dart';


class NameQuizTextField extends StatelessWidget {
    NameQuizTextField({super.key, required this.val});
    NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
    DBQuizController dbQuizController = Get.put(DBQuizController());
    final String? Function(String? s) val;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: TextFormField(
        controller: nameOfQuizController.nameC,
        validator: val,
        maxLength: 50,
        textCapitalization: TextCapitalization.words,
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
        onChanged: (name) {
          nameOfQuizController.name = name ;
          nameOfQuizController.update();
        },
        decoration:  InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gapPadding: 0,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black12),
          ),
          errorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          focusedErrorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          labelText: "  name of quiz".tr,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(letterSpacing: 1, color: Colors.black54,fontSize: 18,),
        ),
      ),
    );
  }
}

class CodeQuizTextField extends StatelessWidget {
  CodeQuizTextField({super.key, required this.val});
  NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
  DBQuizController dbQuizController = Get.put(DBQuizController());
  final String? Function(String? s) val;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: nameOfQuizController.codeC,
        validator: val,
        maxLength: 6,
        textCapitalization: TextCapitalization.words,
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
          if(code.isEmpty){
            nameOfQuizController.code = Random().nextInt(10000)+100000;
            nameOfQuizController.update();
            dbQuizController.getCode();
          }else{
            nameOfQuizController.code = int.parse(code)  ;
            nameOfQuizController.update();
            dbQuizController.getCode();
          }

        },
        decoration:  InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gapPadding: 0,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black12),
          ),
          errorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          focusedErrorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          labelText: "  code of quiz".tr,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(letterSpacing: 1, color: Colors.black54,fontSize: 18,),
        ),
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
   CreateButton({super.key,required this.onPressed});
   DBQuizController dbQuizController = Get.put(DBQuizController());
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorC.teal),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0),
        ),
        margin:  const EdgeInsets.all(15),
        child: TextButton(
            onPressed: onPressed,
            child: Text("Create".tr, style: TextStyle(fontSize: 20, color: ColorC.teal),
            )));
  }
}

class CanselButton extends StatelessWidget {
  const CanselButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorC.teal),
          borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0),
        ),
        margin: const EdgeInsets.all(15),
        child: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel".tr,
              // "${getLang(context, "Create")}",
              style: TextStyle(fontSize: 20, color: ColorC.teal),
            )));
  }
}
