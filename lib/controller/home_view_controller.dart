// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, unnecessary_overrides, camel_case_types, avoid_renaming_method_parameters, prefer_const_literals_to_create_immutables

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
import '../screen/cart.dart';
import '../screen/home/home_screen.dart';
import '../screen/home/home_view.dart';
import '../screen/home/settings.dart';
import '../screen/myfavorite.dart';
import '../screen/seller/AddItem.dart';
import 'auth/login_controller.dart';

abstract class HomeViewcontroller extends GetxController {
  changePage(int currentpage);
}

class HomeViewControllerImp extends HomeViewcontroller {
  int currentpage = 0;

  List<Widget> listPage = [
    HomeScreen(),
    MyFavorite(),
    Cart(),
    setting_view(),
    

    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("cart"))],
    // ),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("Profile"))],
    // ),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("Settings"))],
    // ),
  ];
  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "MyFavorite", "icon": Icons.favorite},
    {"title": "cart", "icon": Icons.storefront_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
