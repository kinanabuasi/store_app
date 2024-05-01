// ignore_for_file: unused_import, sort_child_properties_last, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, unused_field

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../constant/routes.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/model/cartmodel.dart';
import '../data/remote/SellerData.dart';
import '../data/remote/cart_data.dart';
import '../linkapi.dart';
import '../widget/TopSnackBar.dart';
import 'auth/login_controller.dart';

abstract class AddItemController extends GetxController {
  AddItem(context);
}

class AddItemControllerImp extends AddItemController {
  final formStateAddItemkey = GlobalKey<FormState>();
  late TextEditingController itemsName;
  late TextEditingController itemsDescription;
  late TextEditingController itemsCount;
  late TextEditingController itemsActive;
  late TextEditingController itemsPrice;
  late TextEditingController itemsDiscount;
  late TextEditingController itemsCat;
  late TextEditingController itemsimage;
  late String ImageName;
  // SignupData signUpData = SignupData(Get.find());
  SellerData sellerData = SellerData(Get.find());
  LoginControllerImp loginController = Get.put(LoginControllerImp());
  List data = [];
  final _file = Rxn<File>();
  List<DropdownMenuItem<String>> get CatItems {
    List<DropdownMenuItem<String>> menuItems = [
      // ignore: prefer_const_constructors
      DropdownMenuItem(child: Text("1"), value: "1"),
      // ignore: prefer_const_constructors
      DropdownMenuItem(child: Text("2"), value: "2"),
    ];
    return menuItems;
  }

  final selectedValue = '1'.obs;
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];

  @override
  void onInit() {
    itemsName = TextEditingController();
    itemsDescription = TextEditingController();
    itemsCount = TextEditingController();
    itemsActive = TextEditingController();
    itemsPrice = TextEditingController();
    itemsDiscount = TextEditingController();
    itemsCat = TextEditingController();
    itemsimage = TextEditingController();
    // CatItems;
    super.onInit();
  }

  // void uploadImage(PickedFile image) async {
  //   // Upload the image to the server
  //   final url = AppLink.images;
  //   final request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.files.add(http.MultipartFile.fromBytes(
  //     'image',
  //     image.readAsBytesSync(),
  //     filename: image.path,
  //   ));
  //   final response = await request.send();
  //   if (response.statusCode == 200) {
  //     // Image uploaded successfully
  //     print('Image uploaded successfully');
  //   } else {
  //     // Error uploading image
  //     print('Error uploading image: ${response.statusCode}');
  //   }
  // }

  @override
  AddImage(context, File image) async {
    // if (formStateAddItemkey.currentState!.validate()) {
    var statusRequest = StatusRequest.loading;

    print(itemsimage.text);
    var response = await sellerData.AddImage(
      image,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print("===========$statusRequest **");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        TopSnackBar_success(context, "Successfully Added Image");
      } else {
        statusRequest = StatusRequest.failure;
        print("=============================== Controller $response ");
        TopSnackBar_error(context, "Unfortunately, Adding Image is Faild");
      }
    }

    update();
  }

  AddFile(context, FilePickerResult file) async {
    // if (formStateAddItemkey.currentState!.validate()) {
    var statusRequest = StatusRequest.loading;

    print(itemsimage.text);
    var response = await sellerData.AddFile(file);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print("===========$statusRequest **");
    if (StatusRequest.success == statusRequest) {
      // if (response['status'] == "success") {

      TopSnackBar_success(context, "Successfully Added Image");
      // } else {
      // statusRequest = StatusRequest.failure;
      // print("=============================== Controller $response ");
      // TopSnackBar_error(
      //     context, "Unfortunately, Adding Image is Faild");
      // }
    }

    update();
  }

  @override
  AddItem(context) async {
    if (formStateAddItemkey.currentState!.validate()) {
      var statusRequest = StatusRequest.loading;
      print(loginController.UsersIds[0]);
      print(itemsName.text);
      print(itemsDescription.text);
      print(itemsCount.text);
      print(itemsActive.text);
      print(itemsPrice.text);
      print(itemsDiscount.text);
      print(itemsCat.text);
      print(itemsimage.text);
      var response = await sellerData.AddItem(
        loginController.UsersIds[0],
        itemsName.text,
        itemsDescription.text,
        itemsCount.text,
        itemsActive.text,
        itemsPrice.text,
        itemsDiscount.text,
        itemsCat.text,
        itemsimage.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      print("===========$statusRequest **");
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //   data.addAll(response['data']);
          //    print(
          //       "============= success $response['data'] ");
          // print("===********====== Controller success $response ");
          TopSnackBar_success(context, "Successfully Added Item");
          // Get.toNamed(AppRoute.login);
        } else {
          statusRequest = StatusRequest.failure;
          print("=============================== Controller $response ");
          TopSnackBar_error(
              context, "Unfortunately, Adding Item is Faild, Data is False");
        }
      }
    } else {
      TopSnackBar_error(
          context, "Unfortunately, Adding Item is Faild, Not Valid Data");
      //  Get.defaultDialog(
      //     title: "Warning",
      //     middleText:
      //         "Something Wrong, please check your server and try again");
    }
    update();
    // print("=============================== Data $data ");
  }

  @override
  void dispose() {
    itemsName.dispose();
    itemsDescription.dispose();
    itemsCount.dispose();
    itemsActive.dispose();
    itemsPrice.dispose();
    itemsDiscount.dispose();
    itemsCat.dispose();
    itemsimage.dispose();
    super.dispose();
  }
}
