// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constants.dart';
import '../../constant/routes.dart';
import '../../controller/productdetails_controller.dart';
import '../../widget/MyText.dart';
import '../../widget/customappbar.dart';
import 'components/productdetails/priceandcount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant/constants.dart';
import '../../data/model/Product.dart';
import 'components/add_to_cart.dart';
import 'components/color_and_size.dart';
import 'components/counter_with_fav_btn.dart';
import 'components/description.dart';
import 'components/product_title_with_image.dart';
import 'components/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
// final Product product;
  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
        int? countitems = UserSession1().countitem;
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secoundColor,
                onPressed: () {
                  controller.cartController.refreshPage();
                  Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) =>
            // HandlingDataView(
            //   statusRequest: homeController.statusRequest,
            //    widget:
            Container(
              child: ListView(children: [
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
          const TopProductPageDetails(),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              MyText(
                  text: "${controller.itemsModel.itemsName}",
                  color: AppColor.Purple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              Text("${controller.itemsModel.itemsDescription}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColor.grey)),
              const SizedBox(height: 50),
              PriceAndCountItems(
                  onAdd: () {
                    // controller.cartController
                    //     .add(controller.itemsModel.itemsId.toString());
                    // controller.cartController.refreshPage();
                    controller.add();
                  },
                  onRemove: () {
                    // controller.cartController
                    //     .delete(controller.itemsModel.itemsId.toString());
                    // controller.cartController.refreshPage();
                    controller.remove();
                  },
                  price: "${controller.itemsModel.itemsPrice}",
                  count:"${controller.countitems}",
                  // "${controller.countitems}",
                  //  "${controller.countitems}"
                   ),

              const SizedBox(height: 10),
              // Text("Color",
              //     style: Theme.of(context).textTheme.headline1!.copyWith(
              //           color: AppColor.fourthColor,
              //         )),
              // const SizedBox(height: 10),
              // const SubitemsList()
            ]),
          )
        ]),
        ),
        ),
        );
  }
}
