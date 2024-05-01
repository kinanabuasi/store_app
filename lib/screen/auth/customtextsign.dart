// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import '../../constant/constants.dart';

class CustomTextSign extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSign({
    Key? key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: prefer_const_constructors
        Text(
          textone,
          style: TextStyle(color: AppColor.black, fontSize: 18),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
                fontSize: 18),
          ),
        ),
      ],
    );
  }
}
