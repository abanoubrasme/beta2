import 'package:beta/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/myServices.dart';

class AuthMiddleware extends GetMiddleware{
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route){
    if(myServices.sharePref!.getString("email")!=null){
      return const RouteSettings(name: "/home");
    }
    if(myServices.sharePref!.getString("email")!=null){
      return const RouteSettings(name: "/home");
    }

  }
}