// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import '../../constant/constants.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  final double w;
  final double h;

  const CustomButtonAuth(
      {Key? key,
      required this.text,
      this.onPressed,
      required this.color,
      required this.w,
      required this.h})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      minWidth: w,
      height: h,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 249, 243, 188)),
      ),
      color: AppColor.primaryColor,
      textColor: Colors.white,
    );
  }
}
