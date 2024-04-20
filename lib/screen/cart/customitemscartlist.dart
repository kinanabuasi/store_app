// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../constant/constants.dart';
import '../../constant/imageasset.dart';
import '../../linkapi.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: [
          // Container(
          //     // flex: 2,
          //     child: CachedNetworkImage(
          //       imageUrl: "${AppLink.images} $imagename",
          //       height: 50,
          //       width:50,
          //       fit: BoxFit.contain,
          //                   )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            children: [
              Container(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
              Container(
                  height: 20,
                  child: Text(
                    count,
                    // style: TextStyle(fontFamily: "sans"),
                  )),
              Container(
                  height: 25,
                  child:
                      IconButton(onPressed: onRemove, icon: Icon(Icons.remove)))
            ],
          ))
        ]),
      ),
    );
  }
}
