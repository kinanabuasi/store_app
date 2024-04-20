// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/services/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../core/class/statusrequest.dart';
import '../constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/remote/auth/signup_data.dart';
import '../../data/remote/test_data.dart';
import '../../screen/auth/signup.dart';
import '../data/model/categoriesmodel.dart';
import '../data/model/itemsmodel.dart';
import '../data/remote/HomeData.dart';
import 'auth/login_controller.dart';

abstract class HomeController extends GetxController {
  GetData();
  goToItems(List categories, String selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  List<dynamic> categories = [].obs;
  List<dynamic> items = [].obs;
  HomeData homedata = HomeData(Get.find());
  TextEditingController? search;
  late final CategoriesModel categoriesModel;
  bool isSearch = false;
  List<ItemsModel> listdata = [];
  late StatusRequest statusRequest;
  // MyServices myServices = Get.put(MyServices());

  @override
  void onInit() {
    search = TextEditingController();
    GetData();
    super.onInit();
  }

  @override
  GetData() async {
    var statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print("===========$statusRequest **");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.assignAll(response['categories']);
        print(categories);
        print("categories length: ${categories.length}");
        items.assignAll(response['items']);
        print(items);
        print("items length:  ${categories.length} ");
      }
    } else {
      statusRequest = StatusRequest.failure;
      print("=============================== Controller $response ");
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.SearchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
