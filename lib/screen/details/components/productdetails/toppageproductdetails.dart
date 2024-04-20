// ignore_for_file: prefer_const_constructors, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/imageasset.dart';
import '../../../../controller/productdetails_controller.dart';
import '../../../../linkapi.dart';
// import 'package:transparent_image/transparent_image.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(color: AppColor.secoundColor),
        ),
        Positioned(
          top: 30.0,
          right: Get.width / 8,
          left: Get.width / 8,
          // ignore: prefer_const_constructors
          child: Hero(
            tag:
                // "Huawei y7 prime 2018",
                "${controller.itemsModel.itemsId}",
            child:
                // Image.asset(ImageAsset.Huawie),
                //             FadeInImage.memoryNetwork(
                //   placeholder: kTransparentImage,
                //   image: "${AppLink.images}/${controller.itemsModel.itemsImage!}",
                // ),
// ),
                CachedNetworkImage(
              imageUrl:
                  "${AppLink.images}${controller.itemsModel.itemsImage}",
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
