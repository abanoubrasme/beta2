import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/RDB_Controller.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../core/constant/font.dart';
import '../../../core/decoration/Colors.dart';
import '../../../services/myServices.dart';
import '../widget/slideBackground.dart';

class PageOfQuizzes extends StatelessWidget {
   PageOfQuizzes({super.key});
   DBQuizController dbQuizController =Get.put(DBQuizController());
    NameOfQuizController nameOfQuizController=Get.put(NameOfQuizController());
   MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorC.teal,
            elevation: 0,
            title:  Text("Main Page".tr,style: const TextStyle(color: Colors.white)),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (){
                  Get.toNamed("/nameOfQuiz");
                },
                icon: const Icon(Icons.add),
                iconSize: 30,
              )],
            leading: IconButton(icon: const Icon(Icons.arrow_back_outlined),
              color: Colors.white,
              onPressed: () {
                Get.toNamed("/home");
              },),
          ),
          body: FutureBuilder(
            future: dbQuizController.getName(myServices.sharePref!.get("id_user").toString()),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return   Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 150,
                            width: 150,
                            child: Image(image: AssetImage('image/notebook.png'))),
                        const SizedBox(height: 18,),
                        Text("you have no data".tr,style: TextStyle(fontSize: 18,fontFamily: Font.f1),),
                        const SizedBox(height: 50,),
                      ],
                    ),
                );
              }
              if(snapshot.hasError){
                return  const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 150,
                          width: 150,
                          child: Image(image: AssetImage('image/notebook.png'))),
                      SizedBox(height: 18,),
                      Text("you have an error",style: TextStyle(fontSize: 18,fontFamily: 'ProtestStrike'),),
                      SizedBox(height: 50,),
                    ],
                  ),
                );
              }
              else{
                return GetBuilder<NameOfQuizController>(
                    builder: (nameOfQuizController){
                      return ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              myServices.sharePref!.setInt("idQuiz",snapshot.data['data'][index]["id_quiz"]);
                              Get.toNamed("/pageOfQuiz",parameters: {
                                "name_quiz": snapshot.data['data'][index]["name_quiz"]});
                              nameOfQuizController.name = snapshot.data['data'][index]["name_quiz"];
                            },
                            child: Card(
                              child: Dismissible(
                                  movementDuration: const Duration(milliseconds: 1000),
                                  resizeDuration: const Duration(milliseconds: 1000),
                                  background: SlideBackground(
                                    color: ColorC.green, text: 'Edit',
                                    icon: Icons.edit,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30),),
                                  secondaryBackground: SlideBackground(
                                    color: ColorC.red, text: 'Delete',
                                    icon: Icons.delete,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(top: 20, bottom: 20, right: 30),),
                                  key: Key( snapshot.data.toString()),
                                  onDismissed: (direction) {},
                                  confirmDismiss: (direction) async {
                                    myServices.sharePref!.setInt("idQuiz",snapshot.data['data'][index]["id_quiz"]) ;
                                    
                                    if (direction == DismissDirection.endToStart) {
                                      return showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: const Text("Are you sure you want to delete this quiz?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text("Cancel", style: TextStyle(color: Colors.black),),
                                                  onPressed: () {
                                                    Get.back(); },),
                                                TextButton(
                                                  child: const Text("Delete",style: TextStyle(color: Colors.red),),
                                                  onPressed: () {
                                                    dbQuizController.deleteQuiz(myServices.sharePref!.get("idQuiz"));
                                                    nameOfQuizController.update();
                                                    Get.back();

                                                  },),],);
                                          });}
                                    else {}
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 95,
                                          width: 95,
                                          decoration: BoxDecoration(
                                              color: ColorC.teal,
                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20))
                                          ),
                                          child: Center(child: Text("${index+1}",
                                            style: const TextStyle(fontSize: 30,color: Colors.white),))
                                      ),
                                      Padding(
                                          padding:  const EdgeInsets.only(left: 25,),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("${snapshot.data['data'][index]["name_quiz"]}",style: const TextStyle(fontSize: 22),),
                                              const SizedBox(height: 10,),
                                            ],
                                          ))
                                    ],)
                              ),
                            ),
                          );
                        } ,
                      );
                    });
              }
            },
          ),


        );
  }
}




// AnimateIcon(
// key: UniqueKey(),
// onTap: () {},
// iconType: IconType.continueAnimation,
// height: 100,
// width: 100,
// color: Colors.teal,
// animateIcon: AnimateIcons.loading5,
// )