// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.getData(
      AppLink.homepage,
    );
    return response.fold((l) => l, (r) => r);
  }
  SearchData(String Search) async {
    var response = await crud.postData(
      AppLink.search,{"search": Search},{}
    );
    return response.fold((l) => l, (r) => r);
  }
}
