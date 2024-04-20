
// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/routes.dart';
import '../controller/myfavoritecontroller.dart';
import '../core/class/HandlingDataView.dart';
import '../widget/customappbar.dart';
import 'myfavorite/customlistfavoriteitems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
            builder: ((controller) => ListView(children: [
                   CustomAppBar(
                      titleappbar: "Find Product",
                      onPressedSearch: () {
                       controller.homeControllerImp.onSearchItems();
                      },
                      onPressedIconFavorite: () {
                        Get.toNamed(AppRoute.myfavroite);
                      },
                      mycontroller: controller.homeControllerImp.search!,
                      onChanged: (val) {
                        controller.homeControllerImp.checkSearch(val);
                      },
                    ),
                  SizedBox(height: 20) ,
                  // HandlingDataView(
                  //     statusRequest: controller.statusRequest,
                      // widget:
                       GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return  CustomListFavoriteItems(itemsModel: controller.data[index]) ; 
                        },
                      ),
                      // )
                ]))),
      ),
    );
  }
}
 