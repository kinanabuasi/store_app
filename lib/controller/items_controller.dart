// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Home_controller.dart';
import 'package:store_app/controller/auth/login_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../core/class/statusrequest.dart';
import '../constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/remote/auth/signup_data.dart';
import '../../data/remote/test_data.dart';
import '../../screen/auth/signup.dart';
import '../core/services/services.dart';
import '../data/model/categoriesmodel.dart';
import '../data/model/itemsmodel.dart';
import '../data/remote/HomeData.dart';
import '../data/remote/items_data.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(dynamic val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  dynamic catid;
  dynamic selectedCat;

  ItemsData testData = ItemsData(Get.find());
  HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());

  List<dynamic> data = [].obs;

  late StatusRequest statusRequest;

  LoginControllerImp loginController = Get.put(LoginControllerImp());

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    print('categories: ${categories}');
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid.toString());
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid.toString());
    update();
  }

  @override
  getItems(categoryid) async {
    // data.clear();
    print("11");
    // String UsersId = loginController.UsersIds[0];
    // print(loginController.UsersIds);
    int? userId = UserSession().userId;
    print(userId);
    // print(loginController.GetUserId());

    statusRequest = StatusRequest.loading;
    var response =
        await testData.getData(categoryid,userId
        //  loginController.UsersIds[0]
            //  myServices.sharedPreferences.getString("id")!
            );
    print("=============================== Controller $response ");
    // print("UsersId: $UsersId");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.assignAll(response['data']);
        print('Data: ${data}');
        print("22");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
