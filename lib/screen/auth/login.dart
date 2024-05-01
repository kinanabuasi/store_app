// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, unnecessary_import, unused_local_variable, unused_label, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../constant/constants.dart';
import '../../constant/imageasset.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/class/crud.dart';
import '../../constant/routes.dart';
import '../../core/functions/alertexitapp.dart';
import '../../core/functions/localization/validinput.dart';
import '../../widget/MyText.dart';
import 'CustomButtomAuth.dart';
import 'customlogo.dart';
import 'customtextform.dart';
import 'customtextsign.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Crud crud = Get.put(Crud());
    LoginControllerImp controller = Get.put(LoginControllerImp());
    // ForgetPassControllerImp controller1=Get.put(ForgetPassControllerImp());
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 189, 89),
            // image: DecorationImage(
            //   image: AssetImage(
            //     ImageAsset.background2,
            //   ),
            //   fit: BoxFit.cover,
            //   // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            // ),
          ),
          child: Form(
            key: controller.formStateloginkey,
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight / 20,
                ),
                CustomLogoForm(
                  image: ImageAsset.logo,
                  address: "Welcome Back!",
                  sign: "Log in to your accont",
                  h: screenHeight / 5.8,
                  w: screenWidth / 3.5,
                ),
                Column(children: [
                  SizedBox(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.09,
                    child: CustomTextForm(
                      keyboard: TextInputType.emailAddress,
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 6, 100, "email");
                      },
                      mycontroller: controller.email,
                      hintText: "Enter your Email",
                      iconData: Icons.email_outlined,
                      // InitialValue: "kinan@gmail.com",
                      // mycontroller: controller.email,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  //  Obx(() =>
                  SizedBox(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.09,
                    child: CustomTextForm(
                      // obscuretext: controllerImp.isshowpassword,
                      onTapIcon: () {
                        // controllerImp.showPassword();
                        // icon1: Icon(Icons.remove_red_eye_rounded,
                        // color:Colors.red,  );
                      },
                      // obscuretext: true,
                      //   icon2: IconButton(
                      //   icon: Icon(controller.passwordVisible.value
                      //       ? Icons.visibility_off
                      //       : Icons.visibility),
                      //   onPressed: () {
                      //     controller.togglePasswordVisibility();
                      //   },
                      // ),
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: controller.password,
                      hintText: "Password",
                      iconData: Icons.lock_outline_rounded,
                      // mycontroller: controller.password,
                    ),
                  ),
                  // ),
                  // SizedBox(
                  //   height: screenHeight / 17,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     // controllerImp.goToForgetPassword();
                  //   },
                  //   child: MyText(
                  //     text: "Forget your password?",
                  //     textAlign: TextAlign.center,
                  //     color: Colors.black,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),

                  CustomButtonAuth(
                    text: "Sign in",
                    onPressed: () {
                      controller.login(context);
                                         },
                    color: AppColor.primaryColor,
                    w: screenWidth * 0.6,
                    h: screenHeight * 0.1,
                  ),

                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  CustomTextSign(
                      textone: "You don't have an account?  ",
                      texttwo: "Sign Up",
                      onTap: () {
                        controller.goToSignUp();
                      }),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
