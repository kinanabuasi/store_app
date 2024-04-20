
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constants.dart';
import '../../controller/Home_controller.dart';
import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.images}${itemsModel.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          width: 150,
        ),
        Positioned(
            left: 10,
            child: Text(
              "${itemsModel.itemsName}",
              style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))
      ],
    );
  }
}
