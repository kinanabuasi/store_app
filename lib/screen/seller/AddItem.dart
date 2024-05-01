// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace, unused_local_variable, unused_import, use_key_in_widget_constructors, must_be_immutable, camel_case_types, prefer_const_literals_to_create_immutables, use_build_context_synchronously, non_constant_identifier_names

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/screen/home/listitemshome.dart';
import '../../constant/constants.dart';
import '../../constant/imageasset.dart';
import '../../constant/routes.dart';
import '../../controller/AddItemController.dart';
import '../../controller/Home_controller.dart';
import '../../controller/home_view_controller.dart';
import '../../controller/items_controller.dart';
import '../../core/class/HandlingDataView.dart';
import '../../core/class/crud.dart';
import '../../core/functions/localization/validinput.dart';
import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';
import '../../data/model/Product.dart';
import '../../widget/DropdownMenu.dart';
import '../../widget/Image_picker.dart';
import '../../widget/MyText.dart';
import '../../widget/categories.dart';
import '../../widget/customappbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../auth/CustomButtomAuth.dart';
import '../auth/customtextform.dart';
import 'package:file_picker/file_picker.dart';

import '../home/CustomBottomAppBarHome.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemControllerImp());
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<AddItemControllerImp>(
      builder: (controller) => Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          color: AppColor.SkinColor,
          child: Form(
            key: controller.formStateAddItemkey,
            child: ListView(
              children: [
                CustomAppBar(
                  titleappbar: "Find Product",
                  onPressedSearch: () {
                    homeControllerImp.onSearchItems();
                  },
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.myfavroite);
                  },
                  mycontroller: homeControllerImp.search!,
                  onChanged: (val) {
                    homeControllerImp.checkSearch(val);
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.09,
                  child: CustomTextForm(
                    // keyboard: TextInputType.name,
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 2, 20, "");
                    },
                    mycontroller: controller.itemsName,
                    hintText: "Enter item Name",
                    // iconData: Icons.name,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.09,
                  child: CustomTextForm(
                    // keyboard: TextInputType.name,
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 2, 30, "");
                    },
                    mycontroller: controller.itemsDescription,
                    hintText: "Enter Item Description",
                    // iconData: Icons.name,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.09,
                  child: CustomTextForm(
                    // keyboard: TextInputType.name,
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 1, 20, "");
                    },
                    mycontroller: controller.itemsCount,
                    hintText: "Enter Item Count",
                    // iconData: Icons.name,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.09,
                  child: CustomTextForm(
                    // keyboard: TextInputType.name,
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 1, 20, "");
                    },
                    mycontroller: controller.itemsActive,
                    hintText: "Enter Item Active",
                    // iconData: Icons.name,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.09,
                  child: CustomTextForm(
                    // keyboard: TextInputType.name,
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 1, 20, "");
                    },
                    mycontroller: controller.itemsPrice,
                    hintText: "Enter Item Price",
                    // iconData: Icons.name,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.09,
                  child: CustomTextForm(
                    // keyboard: TextInputType.name,
                    isNumber: false,
                    mycontroller: controller.itemsDiscount,
                    valid: (val) {
                      return validInput(val!, 1, 20, "");
                    },
                    hintText: "Enter Item Discount if exist, if not enter 0",
                    // iconData: Icons.name,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.09,
                  child: DropdownItem(
                    valid: (val) {
                      validInput(val!, 2, 30, "ItemCat");
                    },
                    mycontroller: controller.itemsCat,
                    selectedValue: controller.selectedValue.value,
                    Items: controller.items,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                CustomButtonAuth(
                  text: "Pick an image",
                  color: AppColor.secoundColor,
                  onPressed: () async {
                    final File? image;
                    final picker = ImagePicker();
                    final pickedFile = await picker.pickImage(
                        source: ImageSource.gallery, imageQuality: 50);
                    if (pickedFile != null) {
                      image = File(pickedFile.path);
                      // }
                      // if (file) {
                      // Send the file to the controller
                      String fileName = pickedFile.name;
                      controller.itemsimage.text = fileName;
                      print(controller.itemsimage);
                      controller.AddImage(context, image);
                    }
                  },
                  w: screenWidth * 0.6,
                  h: screenHeight * 0.1,
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                CustomButtonAuth(
                  text: "Add Item",
                  color: AppColor.secoundColor,
                  onPressed: () {
                    controller.AddItem(context);
                  },
                  w: screenWidth * 0.6,
                  h: screenHeight * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
