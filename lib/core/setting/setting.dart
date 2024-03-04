import 'package:beta/control/settingController.dart';
import 'package:beta/core/localization/changeLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/myServices.dart';
import '../constant/font.dart';
import '../decoration/Colors.dart';

class Setting extends StatelessWidget {
   Setting({super.key});
   MyServices myServices = Get.put(MyServices());
   SettingController settingController = Get.put(SettingController());
   ChangeLanguageController localeController = Get.put(ChangeLanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorC.white.withOpacity(0),
        title: Text("Setting".tr,
          style: TextStyle(color: ColorC.black,fontFamily: Font.f1),),
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_outlined),
            color: ColorC.black,
        ),
      ),
      body:  GetBuilder<SettingController>(
        builder: (settingController){
          return  ListView(
            children: [
              ListTile(
                title:  Text("Language".tr,style: TextStyle(color: ColorC.black,fontFamily: Font.f1)),
                leading: const Icon(Icons.language),
                onTap: (){
                  if(myServices.sharePref!.get("lang")=="ar"){
                    settingController.checkBoxAR = true;
                    settingController.checkBoxEN = false;
                  }else if(myServices.sharePref!.get("lang")=="en"){
                    settingController.checkBoxEN = true;
                    settingController.checkBoxAR = false;
                  }else {
                    if( Get.deviceLocale!.languageCode.toString()=="ar"){
                      settingController.checkBoxAR  = true;
                      settingController.checkBoxEN = false;
                    }
                    if( Get.deviceLocale!.languageCode.toString()=="en"){
                      settingController.checkBoxEN = true;
                      settingController.checkBoxAR = false;
                    }
                  }
                  Get.bottomSheet(
                      GetBuilder<SettingController>(
                          builder: (settingController){
                        return  Container(
                          height: 180,
                          decoration:  BoxDecoration(
                            color: ColorC.white,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5)
                                    ),

                                    height: 5,
                                    width: 60,
                                  ),
                                ),),
                              const SizedBox(height: 15,),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 8,right: 8),
                                   child: Card(
                                     elevation: 0,
                                     child: CheckboxListTile(
                                       title:  const Text("english"),
                                       value: settingController.checkBoxEN,
                                       onChanged: (value) {
                                        if(settingController.checkBoxEN==false){
                                          settingController.checkBoxEN = true;
                                          settingController.checkBoxAR = false;
                                          localeController.changeLanguage("en");
                                          settingController.update();
                                      }
                                     },
                             ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 8,right: 8),
                                   child: Card(
                                     elevation: 0,
                                     child: CheckboxListTile(
                                       title:  Text("arabic".tr),
                                       value:  settingController.checkBoxAR,
                                       onChanged: (value) {
                                         if(settingController.checkBoxAR==false){
                                           settingController.checkBoxAR = true;
                                           settingController.checkBoxEN = false;
                                           localeController.changeLanguage("ar");
                                           settingController.update();
                                       }

                                       },

                                     ),
                                   ),
                                 ),
                              
                            ],
                          ),
                        );
                      })
                  );
                },
              )
            ],
          );
        },
      )

    );
  }
}
// ListTile(
// title: Text("english".tr,
// style: TextStyle(color: ColorC.black,fontFamily: Font.f1,fontSize: 20),),
// leading: Checkbox.adaptive(
// shape: const OvalBorder(side:BorderSide(width: 20,color: Colors.red) ),
// value: settingController.checkBoxEN,
// onChanged: (value) {
// settingController.checkBoxEN = value!;
// settingController.checkBoxAR = !value!;
// localeController.changeLanguage("en");
// settingController.update();
// },checkColor: ColorC.green,
// activeColor: ColorC.green,
// ),
// onTap: (){
// localeController.changeLanguage("en");
// settingController.checkBoxEN = !settingController.checkBoxEN;
// settingController.checkBoxAR = !settingController.checkBoxAR;
// settingController.update();
// },
// ),
// ListTile(
// title: Text("arabic".tr,
// style: TextStyle(color: ColorC.black,fontFamily: Font.f1,fontSize: 20),),
// leading: Checkbox.adaptive(
// shape: const OvalBorder(side:BorderSide(width: 20,color: Colors.red) ),
// value: settingController.checkBoxAR,
// onChanged: ( value) {
// settingController.checkBoxAR = value!;
// settingController.checkBoxEN = !value!;
// localeController.changeLanguage("ar");
// settingController.update();
// },checkColor: ColorC.green,
// activeColor: ColorC.green,
// ),
// onTap: (){
// print("=============");
// localeController.changeLanguage("ar");
// settingController.checkBoxAR = !settingController.checkBoxAR;
// settingController.checkBoxEN = !settingController.checkBoxEN;
// settingController.update();
// },
// ),