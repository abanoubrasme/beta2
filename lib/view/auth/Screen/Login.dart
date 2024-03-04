import 'package:beta/control/auth/loginController.dart';
import 'package:beta/view/auth/widget/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/AuthController.dart';
import '../../../control/auth/helperController.dart';
import '../../../core/constant/font.dart';
import '../../../core/decoration/Colors.dart';
import '../../../services/myServices.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  Helper helper = Get.put(Helper());
  MyServices myServices = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<Helper>(
        builder: (helper){
      return Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
               Center(
                  child: Text("Login".tr, style: const TextStyle(color: Colors.black38, fontSize: 25,fontFamily: Font.f1),
                  )),
              const SizedBox(height: 50,),
               Center(
                  child: Text("Welcome to BeTa".tr,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 35,fontFamily: Font.f1,
                        fontWeight: FontWeight.w500),
                  )),
              const SizedBox(height: 30,),
              CustomTextField(
                labelText: 'email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
                controller: loginController.email,
                val: (s) {
                  return loginController.validLogin(helper.validator);
                }, obscureText: false, enableSuggestions: true,
              ),
              CustomTextField(
                labelText: 'password',
                prefixIcon:  const Icon(Icons.lock_outline),
                suffixIcon: SizedBox(
                  width: 55,
                  child: MaterialButton(
                    onPressed: (){
                       helper.showPassword();
                    },
                    child: Icon(
                        helper.obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                        color: Colors.grey.shade500),),
                ),
                controller: loginController.password,
                val: (s) {
                  return loginController.validLogin(helper.validator);
                },
                obscureText: !helper.obscure,
                enableSuggestions: helper.obscure,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){

                    }
                    , child:  Text("Do you Forget Password?   ".tr,style: TextStyle(color: ColorC.grey),)),
              ),
              const SizedBox(
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.teal,
                  child:  Text(
                    "Login".tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,fontFamily: Font.f1),
                  ),
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      myServices.sharePref!.setString("email", loginController.email.text);
                      myServices.sharePref!.setString("password", loginController.password.text);
                      loginController.login();
                      loginController.getIdUser();
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do you Create a New Account? ".tr),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/signUp");
                      },
                      child:  Text(
                        "Sign Up".tr,
                        style: TextStyle(color: Colors.teal,fontFamily: Font.f1),
                      ))
                ],
              ),
              const SizedBox(height: 25,),
            ],
          ),
        ),
      );
    });

  }
}
