// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, unnecessary_overrides, camel_case_types, avoid_renaming_method_parameters, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/services/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../controller/home_view_controller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/remote/auth/signup_data.dart';
import '../../data/remote/test_data.dart';
import '../../screen/auth/signup.dart';
import 'CustomButtonAppBar.dart';



class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length + 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomButtonAppBar(
                          textbutton: controller.bottomappbar[i]['title'],
                          icondata: controller.bottomappbar[i]['icon'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentpage == i ? true : false);
                }))
              ],
            )));
  }
}
