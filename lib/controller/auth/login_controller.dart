// ignore_for_file: unused_import, must_call_super, avoid_print, prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/auth/signup_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../core/class/statusrequest.dart';
import '../../constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/remote/auth/login_data.dart';
import '../../widget/TopSnackBar.dart';

abstract class LoginController extends GetxController {
  login(BuildContext context);
  goToSignUp();
  // return_token();
  // showpass();
}

class LoginControllerImp extends LoginController {
  // GlobalKey<FormState> formStateloginkey = GlobalKey();
  final formStateloginkey = GlobalKey<FormState>();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  // bool isshowpass = true;
  LoginData loginData = LoginData(Get.find());
  // MyServices myServices = Get.put(MyServices());

  List data = [];
  List UsersData = [];
  List<String> UsersNames = [];
  List<String> UsersTypes = [];
  List UsersIds = [].obs;
  bool IfSeller = false;

  // LoginControllerImp(find);

  @override
  login(context) async {
    if (formStateloginkey.currentState!.validate()) {
      var statusRequest = StatusRequest.loading;
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller ${response} ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          UsersData.assignAll(response['data']);
          // UsersNames.clear();
          // UsersIds.clear();
          for (var item in UsersData) {
            User user = User(
              id: item["user_id"],
              name: item["user_name"],
              user_type: item["user_type"],
            );
            UsersNames.add(user.name);
            UsersIds.add(user.id);
            UsersTypes.add(user.user_type);
          }
          print("ID: $UsersIds, Name: $UsersNames,Type: $UsersTypes");
          print(UsersIds[0]);
          print(UsersTypes[0]);
          IfSellerUser();
          // print(UsersNames[0]);
          // }
          // UserSession().userId = UsersIds[0];

          TopSnackBar_success(context, "Successfully Log In");
          Get.toNamed(AppRoute.HomeView);
        } else {
          statusRequest = StatusRequest.failure;
          TopSnackBar_error(context,
              "Unfortunately, your Sign In is Faild, Email or password is Wrong");
          //   Get.defaultDialog(
          //       title: "Warning",
          //       middleText:
          //           "Unfortunately, your Sign In is Faild, Email or password is Wrong");
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    // HandleUsersData();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  IfSellerUser() {
    if (UsersTypes[0] == "seller") {
      IfSeller = true;
      print(IfSeller);
    }
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  // @override
  // GetUserId(){
  //   return UsersIds[0];
  // }
  // @override
  // HandleUsersData() async {
  //   String token = data[0];
  //   var statusRequest = StatusRequest.loading;
  //   var response = await loginData.HandleUsersData(token);
  //   print("========== Controller $response ");
  //   // print("token: $token");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // print(response);
  //
  //     UsersData.assignAll(response['users']);
  //     UsersNames.clear();
  //     UsersIds.clear();
  //     for (var item in UsersData) {
  //       User user = User(
  //         id: item["id"],
  //         name: item["name"],
  //       );
  //       UsersNames.add(user.name);
  //       UsersIds.add(user.id);
  //     }
  //     print("ID: $UsersIds, Name: $UsersNames");
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //     print("!!!!!!!!!! Controller $response ");
  //     Get.defaultDialog(title: "Warning", middleText: "No Users Data to view");
  //   }
  // }
}

class User {
  dynamic id;
  dynamic name;
  dynamic user_type;
  User({required this.id, required this.name, required this.user_type});
}

class UserSession {
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;

  int? userId;

  UserSession._internal();
}
