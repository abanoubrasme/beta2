import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:beta/core/decoration/theme/dark_theme.dart';
import 'package:beta/core/decoration/theme/ligt_theme.dart';
import 'package:beta/core/localization/changeLanguage.dart';
import 'package:beta/core/localization/translation.dart';
import 'package:beta/services/myServices.dart';
import 'package:beta/view/auth/Screen/Login.dart';
import 'package:beta/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/constant/pages.dart';

GetStorage box = GetStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  MyServices myServices = Get.put(MyServices());
  @override
  Widget build(BuildContext context) {
    ChangeLanguageController changeLanguageController =Get.put(ChangeLanguageController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: changeLanguageController.language,
      getPages: Pages.pages,
      theme:lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      // ThemeData(fontFamily: myServices.sharePref!.get("lang").toString()=="en"? Font.f1:Font.f2),
      home: AnimatedSplashScreen(
        splash: const Text(
          'BeTa',
          style: TextStyle(
              fontSize: 80,
              color: Colors.white,
              fontFamily: "Water_Brush"),
        ),
        nextScreen: myServices.sharePref!.get("email") != null? Home():Login(),
        splashIconSize: 300,
        backgroundColor: Colors.teal,
      ),
    );
  }
}

