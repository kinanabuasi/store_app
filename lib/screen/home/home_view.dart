// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace, unused_local_variable, unused_import, use_key_in_widget_constructors, must_be_immutable, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/screen/home/listitemshome.dart';
import '../../constant/constants.dart';
import '../../constant/imageasset.dart';
import '../../constant/routes.dart';
import '../../controller/Home_controller.dart';
import '../../controller/home_view_controller.dart';
import '../../controller/items_controller.dart';
import '../../core/class/HandlingDataView.dart';
import '../../core/class/crud.dart';
import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';
import '../../data/model/Product.dart';
import '../../widget/MyText.dart';
import '../../widget/categories.dart';
import '../../widget/customappbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CustomBottomAppBarHome.dart';
import 'customtitlehome.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(HomeViewControllerImp());
    return GetBuilder<HomeViewControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.home_sharp),
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.HomeScreen);
            }),
        bottomNavigationBar:
         CustomBottomAppBarHome(),
       
        body: controller.listPage.elementAt(controller.currentpage),
      ),
    );
  }
}
