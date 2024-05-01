// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace, unused_local_variable, unused_import, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/screen/home/listitemshome.dart';
import '../../constant/constants.dart';
import '../../constant/imageasset.dart';
import '../../constant/routes.dart';
import '../../controller/Home_controller.dart';
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

import 'customtitlehome.dart';

class HomeScreen extends StatelessWidget {
  Crud crud = Get.put(Crud());
  // HomeControllerImp homeController = Get.put(HomeControllerImp());
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    Get.put(HomeControllerImp());
    return Scaffold(
      // bottomNavigationBar: Row(children: []),
      body: GetBuilder<HomeControllerImp>(
        builder: (homeController) =>
            // HandlingDataView(
            //   statusRequest: homeController.statusRequest,
            //    widget:
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    CustomAppBar(
                      titleappbar: "Find Product",
                      onPressedSearch: () {
                        homeController.onSearchItems();
                      },
                      onPressedIconFavorite: () {
                        Get.toNamed(AppRoute.myfavroite);
                      },
                      mycontroller: homeController.search!,
                      onChanged: (val) {
                        homeController.checkSearch(val);
                      },
                    ),
                    !homeController.isSearch
                        ? Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Stack(children: [
                                  Container(
                                    alignment: Alignment.center,
                                    // ignore: prefer_const_constructors
                                    child: ListTile(
                                      title: Text("A summer surprise",
                                          style: TextStyle(
                                              color: AppColor.kTextColor,
                                              fontSize: 20)),
                                      subtitle: Text("Cashback 20%",
                                          style: TextStyle(
                                              color: AppColor.kTextColor,
                                              fontSize: 30)),
                                    ),
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: AppColor.secoundColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Positioned(
                                    top: -20,
                                    right: -20,
                                    child: Container(
                                      height: 160,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: AppColor.secoundShadowColor,
                                          borderRadius:
                                              BorderRadius.circular(160)),
                                    ),
                                  )
                                ]),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              CustomTitleHome(title: "Categories"),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                child: ListCategoriesHome(),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              CustomTitleHome(title: "Product for you"),
                              SizedBox(
                                height: 20,
                              ),
                              ListItemsHome(),
                            ],
                          )
                        : Container(
                            child: ListItemsSearch(
                                listdatamodel: homeController.listdata))
                  ],
                )),
      ),
      // ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (homeController) => Container(
        child: ListView.builder(
            itemCount: listdatamodel.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  homeController.goToPageProductDetails(listdatamodel[index]);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.images}${listdatamodel[index].itemsImage}")),
                        Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Text(listdatamodel[index].itemsName!),
                              subtitle:
                                  Text(listdatamodel[index].categoriesName!),
                            )),
                      ],
                    ),
                  )),
                ),
              );
            }),
      ),
    );
  }
}
