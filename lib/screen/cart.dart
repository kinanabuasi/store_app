// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import 'cart/appbarcart.dart';
import 'cart/custom_bottom_navgationbar_cart.dart';
import 'cart/customitemscartlist.dart';
import 'cart/topcardcart.dart';

class Cart extends StatelessWidget {
   Cart({Key? key}) : super(key: key);
 CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: "0",
                // controllercoupon: controller.controllercoupon!,
                // onApplyCoupon: () {
                //   controller.checkcoupon();
                // },
                price: "${cartController.priceorders}",
                discount: "${controller.discountcoupon}%",
                totalprice: "${controller.getTotalPrice()}")),
        body: GetBuilder<CartController>(
            builder: ((controller) =>
             Container(
                // statusRequest: controller.statusRequest,
                child: 
                ListView(
                  children: [
                    TopAppbarCart(
                      title: 'My Cart',
                    ),
                    SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${cartController.totalcountitems} Items in Your List"),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartController
                                      .add(cartController.data[index].itemsId.toString());
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.delete(
                                      cartController.data[index].itemsId.toString());
                                  cartController.refreshPage();
                                },
                                imagename:
                                    '${cartController.data[index].itemsImage}',
                                name: "${cartController.data[index].itemsName}",
                                price:
                                    "${cartController.data[index].itemsprice} \$",
                                count:
                                    "${cartController.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
