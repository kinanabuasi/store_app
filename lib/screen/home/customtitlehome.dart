// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../constant/constants.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      // padding: EdgeInsets.only(right: 300),
      // child: Padding(
        // padding: const EdgeInsets.only(right: 350),
        child: Text(title,
            style: TextStyle(
                fontSize: 20,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold)),
      // ),
    );
  }
}
