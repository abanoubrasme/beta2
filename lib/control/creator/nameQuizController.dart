import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NameOfQuizController extends GetxController{
  final TextEditingController nameC = TextEditingController();
  late final TextEditingController codeC = TextEditingController();
   String name = "   ";
   int code = 111;
   int vall = 1;
   // int code = Random().nextInt(1000)+1000;

}