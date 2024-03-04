import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constant/font.dart';
import '../core/decoration/Colors.dart';
import '../services/myServices.dart';
import 'creator/widget/Button/customFloatingActionButton.dart';

class Home extends StatelessWidget {
   Home({super.key});
  MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: ColorC.teal,
        appBar: AppBar(
           title:  Column(
               children: [
                 const SizedBox(height: 40,),
                  Text(
                    'BeTa',
                    style: TextStyle(
                        fontSize: 70,
                        color: ColorC.white,
                        fontFamily: "Water_Brush"),
                  ),
                  ],
                ),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 100,
          backgroundColor: ColorC.teal,
          leading:const Text(""),
          actions: [
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                iconSize: 30,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  onSelected:(e){
                    if(e==1){
                      Get.toNamed('/setting');
                    }
                    if(e==2){
                      myServices.sharePref!.clear();
                      Get.offAllNamed('/login');
                    }
                  },
                  elevation: 10,
                  color: Colors.white,
                  itemBuilder: (BuildContext context)=><PopupMenuEntry>[
                     PopupMenuItem(
                        value: 1,
                        child: Row(
                            children: [
                              Icon(Icons.settings,color: Colors.grey[700]),
                              const SizedBox(width: 10,),
                              Text('Setting'.tr,style: TextStyle(color: Colors.grey[700],
                                  fontFamily:myServices.sharePref!.get("lang")=="en"? Font.f1 : Font.f2  ),),
                             // SizedBox(width: 50,)
                            ],
                          ),
                    ),
                     PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(Icons.login,color: Colors.grey[700]),
                            const SizedBox(width: 10,),
                            Text("LogOut".tr,style: TextStyle(color: Colors.grey[700], fontFamily: Font.f1),),
                          ],
                        )
                    ),
                  ]
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(height: 60,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 8,
                        blurRadius: 7,
                        offset:  const Offset(5, 1)
                      )
                    ]
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomFloatingActionButton(
                          icon: const Icon(
                            Icons.content_paste,
                            color: Colors.teal,
                            size: 60,),
                          page: "/pageOfQuizzes",
                          width: 80,
                          height: 80,
                          text: 'Create'.tr,),
                        const SizedBox(width: 30,),
                        CustomFloatingActionButton(
                          icon:const Icon(
                          Icons.play_lesson_outlined,
                          color: Colors.teal,
                          size: 60,),
                          page:"/codeOfQuiz",
                          width: 80,
                          height: 80,
                          text: 'Play'.tr,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}