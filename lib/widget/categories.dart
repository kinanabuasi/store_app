// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace, unused_local_variable, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constant/constants.dart';
import '../constant/imageasset.dart';
import '../controller/Home_controller.dart';
import '../data/model/categoriesmodel.dart';
import '../linkapi.dart';
import 'MyText.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeControllerImp homeController = Get.put(HomeControllerImp());

    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return CategoriesList(
            i: index,
            categoriesModel: CategoriesModel.fromJson(category),
          );
        },
      ),
    );
  }
}

class CategoriesList extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const CategoriesList(
      {Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeControllerImp homeController = Get.put(HomeControllerImp());
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i.toString(), categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            // color: AppColor.primaryColor,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: 
                   NetworkImage(
                      AppLink.images + categoriesModel.categoriesImage!),
                  fit: BoxFit.fill,
                ),
                // color: AppColor.secoundColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            // child: MyText(
            //   text: categoriesModel.categoriesName!,
            //   //  categoriesModel.categoriesName.toString(),
            //   color: AppColor.kTextColor,
            //   fontSize: 25,
            //   fontWeight: FontWeight.normal,
            // ),
            //  SvgPicture.network(
            //     "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
            //     color: AppColor.secoundColor),
          ),
          Text(
            categoriesModel.categoriesName!,
            style: TextStyle(fontSize: 13, color: AppColor.kTextColor),
          )
        ],
      ),
    );
  }
}
