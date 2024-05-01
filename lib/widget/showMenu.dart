// // ignore_for_group: prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
// ignore_for_group: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace, avoid_print, unused_element
// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, void_checks, camel_case_types, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, unused_element, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../constant/imageasset.dart';
import '../../screen/auth/signup.dart';
import '../controller/auth/login_controller.dart';
import '../controller/auth/logout_controller.dart';
import '../core/functions/localization/validinput.dart';

class ShowMenu extends StatelessWidget {
  late final List<String> MenuList;
  

  ShowMenu({required this.MenuList});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: MenuList.length,
          itemBuilder: (BuildContext context, int index) {
            // dynamic UsersId = loginControllerImp.UsersIds[index];

            return ListTile(
              title: Text(MenuList[index].toString()),
              onTap: () {
                             },
            );
          },
        ),
      ),
    );
  }
}
