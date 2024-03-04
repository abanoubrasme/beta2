import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../services/myServices.dart';

class ChangeLanguageController extends GetxController{
  Locale? language;
  MyServices myServices = Get.put(MyServices());

  changeLanguage(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharePref!.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    var shareLang = myServices.sharePref?.get("lang");
    if(shareLang == "ar"){
      language = const Locale("ar");
    }else if(shareLang == "en"){
      language = const Locale("en");
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
      myServices.sharePref!.setString("lang", Get.deviceLocale!.languageCode.toString());

    }
    super.onInit();
  }
}