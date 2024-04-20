// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace, unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/widget/MyText.dart';
import '../constant/constants.dart';
import '../constant/imageasset.dart';
import '../controller/Home_controller.dart';
import '../data/model/categoriesmodel.dart';
import '../linkapi.dart';
import 'widget/categories.dart';

class test extends StatelessWidget {
  test({super.key});
  HomeControllerImp homeController = Get.put(HomeControllerImp());
  @override
  Widget build(BuildContext context) {
    print("categories: ${homeController.categories}");
    print("length:  ${homeController.categories.length} ");
    print("items: ${homeController.items}");
    print("length:  ${homeController.items.length} ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
      ),
      backgroundColor: AppColor.grey,
      body: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: homeController.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = homeController.categories[index];
            return Column(
              children: [
                CategoriesList(
          i: index,
          categoriesModel:
              CategoriesModel.fromJson(category),
        ),

                // Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage(ImageAsset.logo),
                //     ),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   height: 50,
                //   width: 50,
                //   child: MyText(
                //     text: category.categoriesName!,
                //     //  categoriesModel.categoriesName.toString(),
                //     color: AppColor.kTextColor,
                //     fontSize: 10,
                //     fontWeight: FontWeight.normal,
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
      // ),
    );
  }
}
