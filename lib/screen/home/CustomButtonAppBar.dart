// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../constant/constants.dart';
import '../../widget/MyText.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonAppBar(
      {Key? key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icondata,
            color: active == true ? AppColor.primaryColor : AppColor.grey),
        MyText(
            text: textbutton,
            color: active == true ? AppColor.primaryColor : AppColor.grey,
            fontSize: 15,
            fontWeight: FontWeight.normal),
        
      ]),
    );
  }
}
 //  BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 10,
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       Row(
        //         children: [
        //           MaterialButton(
        //             onPressed: () {},
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Icon(Icons.home_sharp),
        //                 MyText(
        //                     text: "Home",
        //                     color: AppColor.secoundColor,
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.normal),
        //               ],
        //             ),
        //           ),
        //           MaterialButton(
        //             onPressed: () {},
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Icon(Icons.home_sharp),
        //                 MyText(
        //                     text: "Home",
        //                     color: AppColor.secoundColor,
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.normal),
        //               ],
        //             ),
        //           )
        //         ],
        //       ),
        //       Spacer(),
        //       Row(
        //         children: [
        //           MaterialButton(
        //             onPressed: () {},
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Icon(Icons.home_sharp),
        //                 MyText(
        //                     text: "Home",
        //                     color: AppColor.secoundColor,
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.normal),
        //               ],
        //             ),
        //           ),
        //           MaterialButton(
        //             onPressed: () {},
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Icon(Icons.home_sharp),
        //                 MyText(
        //                     text: "Home",
        //                     color: AppColor.secoundColor,
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.normal),
        //               ],
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),