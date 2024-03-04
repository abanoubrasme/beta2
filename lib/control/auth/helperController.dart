import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Helper extends GetxController{
  String email1 = "";
  String userName1 = "";
  String pass1 = "";
  bool validator = true;
  bool obscure = false;

  showPassword(){
    obscure = !obscure;
    update();
  }

}