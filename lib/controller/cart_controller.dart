
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/model/cartmodel.dart';
import '../data/remote/cart_data.dart';
import 'auth/login_controller.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;

  CartData cartData = CartData(Get.find());

  int? discountcoupon = 0;
  String? couponname;

  late StatusRequest statusRequest;

  // CouponModel? couponModel;

  // MyServices myServices = Get.find();

  List<CartModel> data = [];

  dynamic priceorders = 0.0;

  dynamic totalcountitems = 0;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    int? userId = UserSession().userId;
    update();
    var response = await cartData.addCart(
        // myServices.sharedPreferences.getString("id")!,
       userId.toString(),
         itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("Successfully added to cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  getTotalPrice(){
   return (priceorders - priceorders * discountcoupon! / 100 )   ; 
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        // myServices.sharedPreferences.getString("id")!,
        "3",
         itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("Successfully deleted from cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  // checkcoupon() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await cartData.checkCoupon(controllercoupon!.text);
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       Map<String, dynamic> datacoupon = response['data'];
  //       couponModel = CouponModel.fromJson(datacoupon);
  //       discountcoupon = int.parse(couponModel!.couponDiscount!);
  //       couponname = couponModel!.couponName ; 
  //     } else {
  //       // statusRequest = StatusRequest.failure;
  //       discountcoupon = 0 ; 
  //       couponname = null ; 
  //     }
  //     // End
  //   }
  //   update();
  // }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    int? userId = UserSession().userId;
    update();
    var response =
        await cartData.viewCart(
          // myServices.sharedPreferences.getString("id")!
          userId.toString(),
        );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        // if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount'].toString());
          priceorders = double.parse(dataresponsecountprice['totalprice'].toString());
          print(priceorders);
        // }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
