// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:store_app/controller/Home_controller.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/model/myfavorite.dart';
import '../data/remote/myfavorite_data.dart';
import 'auth/login_controller.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  LoginControllerImp loginController = Get.put(LoginControllerImp());

  // MyServices myServices = Get.find();

//  key => id items
//  Value => 1 OR 0

  getData() async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    // int? userId = UserSession().userId;
    var response = await favoriteData.getData(
        // myServices.sharedPreferences.getString("id")!
        loginController.UsersIds[0]);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // if (responsedata != Null) {
        data.assignAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        // }
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = favoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
    getData();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
