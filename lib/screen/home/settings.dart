// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace, unused_local_variable, unused_import, use_key_in_widget_constructors, must_be_immutable, camel_case_types, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/screen/home/listitemshome.dart';
import '../../constant/constants.dart';
import '../../constant/imageasset.dart';
import '../../constant/routes.dart';
import '../../controller/Home_controller.dart';
import '../../controller/auth/login_controller.dart';
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

class setting_view extends StatelessWidget {
  const setting_view({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp loginControllerImp=Get.put(LoginControllerImp());
    return  Container(
        margin: EdgeInsets.all(50),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_sharp,
              size: 100,
            ),
            SizedBox(
              height: 10,

            ),
            // Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment :CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              // children: [
               loginControllerImp.IfSeller
               ? ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.AddItem);
                  },
                  title: Center(
                    child: MyText(
                        text: "Add Item",
                        color: AppColor.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ): ListTile(
                  onTap: () {
                    // Get.toNamed(AppRoute.AddItem);
                  },
                  title: Center(
                    child: MyText(
                        text: "Home Page",
                        color: AppColor.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              
            
            ListTile(
              title: Center(
                child: MyText(
                    text: "about",
                    color: AppColor.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
            ListTile(
              title: Center(
                child: MyText(
                    text: "Myfavorite",
                    color: AppColor.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
            ListTile(
              title: Center(
                child: MyText(
                    text: "Cart",
                    color: AppColor.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
              ListTile(
              title: Center(
                child: MyText(
                    text: "Log out",
                    color: AppColor.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
            // ],
        // ),
          ],
        ),
      // ),
    );
  }
}
