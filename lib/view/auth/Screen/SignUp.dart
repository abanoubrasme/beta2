import 'package:beta/control/auth/AuthController.dart';
import 'package:beta/view/auth/widget/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/helperController.dart';
import '../../../core/constant/font.dart';
import '../../../services/myServices.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());
  Helper helper = Get.put(Helper());
  MyServices myServices = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Helper>(
        builder: (helper){
          return Scaffold(
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20,),
                 Center(
                    child: Text(
                      "Sign Up".tr,
                      style: const TextStyle(color: Colors.black38,fontSize: 25,fontFamily: 'ProtestStrike'),
                    )),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                    child: Text(
                      "Welcome to BeTa",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 35,fontFamily: Font.f1),
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: 'user name',
                  prefixIcon: const Icon(
                    Icons.person_outline_outlined,
                  ),
                  controller: authController.userName,
                  val: (s) {
                    return authController.validator(s!, 15, 3);
                  }, obscureText: false, enableSuggestions: true,

                ),
                CustomTextField(
                  labelText: 'email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  controller: authController.email,
                  val: (s) {
                    return authController.validator(s!, 40, 3);
                  }, obscureText: false, enableSuggestions: true,

                ),
                CustomTextField(
                  labelText: 'password',
                  prefixIcon: const Icon(Icons.lock_outline),
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
                  controller: authController.password,
                  val: (s) {
                    return authController.validator(s!, 15, 3);
                  },
                  obscureText: !helper.obscure,
                  enableSuggestions: helper.obscure,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("Do you Have An Account?".tr),
                    TextButton(
                        onPressed: () {
                          Get.toNamed("/login");
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.teal,fontFamily: Font.f1),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 140),
                  child: MaterialButton(
                    minWidth: 100,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.teal,
                    child:  Text(
                      "Sign Up".tr,
                      style: const TextStyle(color: Colors.white, fontSize: 20,fontFamily: Font.f1),
                    ),
                    onPressed: () {
                      authController.getEmail();
                      helper.update();
                      if(formKey.currentState!.validate()){
                        myServices.sharePref!.setString("userName", authController.userName.text);
                        myServices.sharePref!.setString("email", authController.email.text);
                        myServices.sharePref!.setString("password", authController.password.text);
                        authController.signUp(
                          authController.userName.text,
                          authController.email.text,
                          authController.password.text,
                        );

                      }


                    },
                  ),
                ),
              ],
            ),
          ),
        );
        });
  }
}
