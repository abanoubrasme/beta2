import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constant/link_api.dart';
import '../main.dart';
import '../model/RequestData.dart';
import '../services/myServices.dart';
import 'creator/QuizController.dart';
import 'creator/nameQuizController.dart';

class DBQuizController extends GetxController{
  NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
  QuizController quizController = Get.put(QuizController());
   GlobalKey<FormState> formKey  = GlobalKey<FormState>();
  RequestData requestData = RequestData();
  MyServices myServices = Get.find();

  String vals = "" ;
  insertData(String idUser,String idQuiz)async{
    var response = await requestData.postRequest(linkInsertData, {
      "question"       :quizController.question.toString(),
      "answer1"        :quizController.answer1.toString(),
      "answer2"        :quizController.answer2.toString(),
      "answer3"        :quizController.answer3.toString(),
      "answer4"        :quizController.answer4.toString(),
      "correct_answer" :quizController.correctAnswer.toString(),
      "time"           :quizController.time.toString(),
      "color"          :quizController.answerColor.toString(),
      "index_color"    :quizController.selectIndexCorrect.toString(),
      "index_time"     :quizController.selectIndexTime.toString(),
      "id_quiz"        :idQuiz.toString(),
      "id_user"        :idUser.toString(),
    });
    if(response["status"]=="success"){
      print("1=====================");
      print(quizController.question);
      Get.toNamed("/pageOfQuiz");
    }else{
      print("Sign Up is Fail -----------------------------");
    }
  }
  updateData(String idQuestion) async {
    var response = await requestData.postRequest(linkUpdateData, {
      "question"       :quizController.question,
      "answer1"        :quizController.answer1,
      "answer2"        :quizController.answer2,
      "answer3"        :quizController.answer3,
      "answer4"        :quizController.answer4,
      "correct_answer" :quizController.correctAnswer.toString(),
      "time"           :quizController.time.toString(),
      "color"          :quizController.answerColor.toString(),
      "index_color"    :quizController.selectIndexCorrect.toString(),
      "index_time"     :quizController.selectIndexTime.toString(),
      "id_question"    :idQuestion.toString()
    });
    if(response["status"]=="success"){
     return response;
    }else{
      print("Sign Up is Fail -----------------------------");
    }
  }
  // updateTime(String idQuestion,int time,int selectIndexTime) async {
  //   var response = await requestData.postRequest(linkUpdateTime, {
  //     "time"           :time.toString(),
  //     "index_time"     :selectIndexTime.toString(),
  //     "id_question"    :idQuestion.toString()
  //   });
  //   if(response["status"]=="success"){
  //    return response;
  //   }if(response["status"]=="fail"){
  //     print("Sign Up is Fail -----------------------------");
  //   }
  // }
  updateCorrectAnswer(String idQuestion,String color,int selectIndexColor,String correctAnswer) async {
    var response = await requestData.postRequest(linkUpdateAnswer, {
      "color"            :color.toString(),
      "index_color"      :selectIndexColor.toString(),
      "correct_answer"   :correctAnswer.toString(),
      "id_question"      :idQuestion.toString()
    });
    if(response["status"]=="success"){
     return response;
    }if(response["status"]=="fail"){
      print("Sign Up is Fail -----------------------------");
    }
  }
  updateQuestion(String idQuestion, var new_, var column) async {
    var response = await requestData.postRequest(linkUpdateQuestion, {
      "column"             :column.toString(),
      "new_"                 :new_.toString(),
      "id_question"        :idQuestion.toString()
    });
    if(response["status"]=="success"){
     return response;
    }
    if(response["status"]=="fail"){
      print("Sign Up is Fail -----------------------------");
    }
  }
  // updateAnswer(String idQuestion,String answer) async {
  //   var response = await requestData.postRequest(linkUpdateQuestion, {
  //     "question"             :answer.toString(),
  //     "id_question"        :idQuestion.toString()
  //   });
  //   if(response["status"]=="success"){
  //    return response;
  //   }if(response["status"]=="fail"){
  //     print("Sign Up is Fail -----------------------------");
  //   }
  // }
  getData(String idUser)async{
    var response = await requestData.postRequest(linkGetData, {
      "id_user" : idUser.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
  }
  getQuiz(String idUser, idQuiz)async{
    var response = await requestData.postRequest(linkGetQuiz, {
      "id_quiz" : idQuiz.toString(),
      "id_user" : idUser.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
  }
  getData2(String question)async{
    var response = await requestData.postRequest(linkGetData2, {
      "question" : question.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }
  }
  getName(String idUser)async{
    var response = await requestData.postRequest(linkGetName, {
      "id_user" : idUser.toString(),
    });
    if (response["status"] == "success"){
      return response;
    }

  }
  addName(var name,var code, var idUser)async{
        var response = await requestData.postRequest(linkAddName, {
          "name_quiz": name.toString(),
          "code_quiz": code.toString(),
          "id_user": idUser.toString(),
        });
        if (response["status"] == "success") {
          nameOfQuizController.nameC.text = "";
          nameOfQuizController.codeC.text = "";
          Get.toNamed("/pageOfQuizzes");
        } else {
          print("Sign Up is Fail -----------------------------");
        }

  }
  getCode()async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" :nameOfQuizController.code.toString(),
    });
    if(response["status"]=="success"){
     int val = response["data"][0]["code_quiz"];
     nameOfQuizController.vall = val;
     nameOfQuizController.update();

    }
  }
  getCodeCheck(code)async{
    var response = await requestData.postRequest(linkGetCode, {
      "code_quiz" :code.toString(),
    });
    if(response["status"]=="success"){
      myServices.sharePref!.setInt("idQuiz",response["data"][0]["id_quiz"]) ;
      if(response["data"].length > 0){
        print(response["data"].length);
        Get.toNamed("/player");
      }
      else{
        Get.toNamed("/pageOfQuiz");
      }
    }
  }
  getIdQuiz()async{
    var response = await requestData.postRequest(linkGetIdQuiz, {
      "name_quiz" :nameOfQuizController.name.toString(),
    });
    if(response["status"]=="success"){
     return response;

    }
  }
  getIdQuestion()async{
    var response = await requestData.postRequest(linkGetIdQuestion, {
      "question" :quizController.question.toString(),
    });
    if(response["status"]=="success"){
     return response;

    }
  }

  deleteQuiz(idQuiz)async{
    var response = await requestData.postRequest(linkDeleteQuiz, {
      "id_quiz" :idQuiz.toString(),
    });
    if(response["status"]=="success"){
      return response;
    }else{
      print("Error===================");
    }
  }


  validatorName (String val ,int max,int min ){
    if(nameOfQuizController.vall.toString()==val){
      return "this code is already existing";
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
  }


