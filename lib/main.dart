// ignore_for_file: unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      color: Colors.white,
      // routes: routes,
      getPages: routes,
    );
  }
}
// client1@gmail.com 12345678
//tomas@gmail.com 11112222
