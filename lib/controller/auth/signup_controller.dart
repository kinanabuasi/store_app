// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../core/class/statusrequest.dart';
import '../../constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/remote/auth/signup_data.dart';
import '../../data/remote/test_data.dart';
import '../../screen/auth/signup.dart';
import '../../widget/TopSnackBar.dart';
import '../../widget/showMenu.dart';

abstract class SignUpController extends GetxController {
  signUp(context);
  goToLogIn();
  // togglePasswordVisibility();
  // showpassword();
}

class SignUpControllerImp extends SignUpController {
  late State<Overlay> context;
  final formStatesignupkey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController type;
  // bool isshowpassword = true;
  SignupData signUpData = SignupData(Get.find());
  List data = [];
  var passwordVisible = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("seller"), value: "seller"),
      DropdownMenuItem(child: Text("client"), value: "client"),
    ];
    return menuItems;
  }

  final selectedValue = 'seller'.obs;
  final items = [
    'seller',
    'client',
  ].obs;

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    type = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    type.dispose();
    super.dispose();
  }

  @override
  signUp(context) async {
    if (formStatesignupkey.currentState!.validate()) {
      var statusRequest = StatusRequest.loading;
      var response = await signUpData.postdata(
          username.text, email.text, password.text, phone.text, type.text);
      print("=============================== Controller success $response ");
      statusRequest = handlingData(response);
      print("===========$statusRequest **");
      if (StatusRequest.success == statusRequest) {
        // if (response['statue'] == "success") {
        //   data.addAll(response['data']);
        //    print(
        //       "============= success $response['data'] ");
        print("===********====== Controller success $response ");
        TopSnackBar_success(context, "Successfully Sign Up");
        Get.offNamed(AppRoute.login);
      } else {
        statusRequest = StatusRequest.failure;
        print("=============================== Controller $response ");
        TopSnackBar_error(context,
            "Unfortunately, your Sign UP is Faild, Email is Already exist");
      }
      // }
      update();
    } else {
      //  Get.defaultDialog(
      //     title: "Warning",
      //     middleText:
      //         "Something Wrong, please check your server and try again");
    }
    // print("=============================== Data $data ");
  }

  @override
  goToLogIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  showpassword() {}

  // @override
  // showMenu() {
  //   ShowMenu(MenuList:[ "client","seller"]);
  // }
}
