import 'package:beta/services/myServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';
import 'helperController.dart';

class LoginController extends GetxController {

  RequestData requestData = RequestData();
  MyServices myServices = Get.find();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email    = TextEditingController();
  Helper helper = Get.put(Helper());

  login()async{
    var response = await requestData.postRequest(linkLogin, {
      "email"    :email.text,
      "password" :password.text,
    });
    if(response["status"]=="success"){
      helper.validator=false;
      helper.update();
      myServices.sharePref!.setString("email", email.text);
      myServices.sharePref!.setString("password", password.text);
      Get.toNamed("/home",arguments: [getIdUser()]);
    }else{
      validLogin(helper.validator);
    }
  }
  checkEP() async {
    var response = await requestData.postRequest(linkLogin, {
      "email"    :email.text,
      "password" :password.text,
    });
    if(response["status"]=="success"){
      helper.validator=false;
      helper.update();
    }
  }
  getIdUser()async{
    var response = await requestData.postRequest(linkGetIdUser, {
      "email"    :email.text,
    });
    if(response["status"]=="success"){
      myServices.sharePref!.setString("id_user", response["data"][0]["id_user"].toString());

    }
  }
  validator (String val ,int max,int min ){

    if(helper.email1==val||helper.userName1==val){
      return "the User Name or Email is already exist";
    }
    if(val.isEmpty){
      return "not validator";
    }
    if(val.length>max){
      return "not validator";
    }
    if(val.length<min){
      return "not validator";
    }
  }
  validLogin (bool s){
    if(s){
      return "the user name or password is ";
    }

  }

@override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

}