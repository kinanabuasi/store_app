import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/remote/favorite_data.dart';
import 'auth/login_controller.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  // MyServices myServices = Get.find();

  Map isFavorite = {};

//  key => id items
//  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    int? userId = UserSession().userId;
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        // myServices.sharedPreferences.getString("id")!
         userId.toString(),
        itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("Successfully Added to favorite"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    // End
    // }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    int? userId = UserSession().userId;
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        // myServices.sharedPreferences.getString("id")!
         userId.toString(),
        itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
      Get.rawSnackbar(
          title: "Notification",
           messageText: const Text("Successfully deleted from favorite "));
      // data.addAll(response['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    // End
    }
    update();
  
  }
}
