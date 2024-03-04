import 'package:get/get.dart';
import '../services/myServices.dart';


class SettingController extends GetxController{

  MyServices myServices = Get.find();
  bool checkBoxEN = false ;
  bool checkBoxAR = false ;
      checkBox(){
        if(myServices.sharePref!.get("lang")=="ar"){
          checkBoxAR = true;
        }else if(myServices.sharePref!.get("lang")=="en"){
          checkBoxEN = true;
        }else {
          if( Get.deviceLocale!.languageCode.toString()=="ar"){
            checkBoxAR = true;
          }
          if( Get.deviceLocale!.languageCode.toString()=="en"){
            checkBoxEN = true;
          }
        }
      }
}