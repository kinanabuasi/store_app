// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace, unused_local_variable, unused_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constant/routes.dart';
import '../../controller/favorite_controller.dart';
import '../../controller/items_controller.dart';
import '../../core/class/HandlingDataView.dart';
import '../../core/class/crud.dart';
import '../../data/model/itemsmodel.dart';
import '../../widget/customappbar.dart';
import 'customlistitems.dart';
import 'listcategoirseitems.dart';

class items_view extends StatelessWidget {
  items_view({super.key});
  Crud crud = Get.put(Crud());
  @override
  Widget build(BuildContext context) {
    // ItemsControllerImp itemsControllerImp = Get.put(ItemsControllerImp());
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: Row(children: [
            //     Expanded(
            //         child: TextFormField(
            //       decoration: InputDecoration(
            //           prefixIcon: Icon(Icons.search),
            //           hintText: "Find Product",
            //           hintStyle: TextStyle(fontSize: 18),
            //           border: OutlineInputBorder(
            //               borderSide: BorderSide.none,
            //               borderRadius: BorderRadius.circular(10)),
            //           filled: true,
            //           fillColor: Colors.grey[200]),
            //     )),
            //     SizedBox(width: 10),
            //     Container(
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(10)),
            //       width: 60,
            //       padding: EdgeInsets.symmetric(vertical: 8),
            //       child: IconButton(
            //           onPressed: () {},
            //           icon: Icon(
            //             Icons.notifications_active_outlined,
            //             size: 30,
            //             color: Colors.grey[600],
            //           )),
            //     )
            //   ]),
            // ),
            // SizedBox(height: 20),
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
           SizedBox(
            height: 10,
           ),
            ListCategoriesItems(),
            
                  //  HandlingDataView(
                  //     statusRequest: controller.statusRequest,
                  //     widget:
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        controllerFav.isFavorite[controller.data[index]['item_id']] = controller.data[index]['favorite'];
                        return CustomListItems(
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]));
                      }),
              // ),
            
          ],
          ),
        ),
      ),
    );
  }
}
