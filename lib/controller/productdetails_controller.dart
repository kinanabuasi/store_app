import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Home_controller.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/model/itemsmodel.dart';
import '../data/remote/cart_data.dart';
import 'auth/login_controller.dart';
import 'cart_controller.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController cartController = Get.put(CartController());
  HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  LoginControllerImp loginController = Get.put(LoginControllerImp());

  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  // MyServices myServices = Get.find();

  int countitems = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!);
    update();
  }

  getCountItems(int itemsid) async {
    statusRequest = StatusRequest.loading;
    // int? userId = UserSession().userId;
    var response = await cartData.getCountCart(
        // myServices.sharedPreferences.getString("id")!,
        loginController.UsersIds[0],
        itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        dynamic countitems = 0;
        countitems = response['data'];
        // int.parse(response['data']);
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    // int? userId = UserSession().userId;
    update();
    var response = await cartData.addCart(
        // myServices.sharedPreferences.getString("id")!,
        loginController.UsersIds[0],
        itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("Product Successfully Added to cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    // int? userId = UserSession().userId;
    update();

    var response = await cartData.deleteCart(
        // myServices.sharedPreferences.getString("id")!,
        loginController.UsersIds[0],
        itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("Product Successfully Deleted from cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yellow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  add() {
    addItems(itemsModel.itemsId.toString());
    countitems++;
    // UserSession1().countitem =countitems;
    print("countitems: ");
    print(countitems);
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteitems(itemsModel.itemsId.toString());
      countitems--;
      // UserSession1().countitem =countitems;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}

class UserSession1 {
  static final UserSession1 _instance = UserSession1._internal();
  factory UserSession1() => _instance;

  int? countitem;

  UserSession1._internal();
}
