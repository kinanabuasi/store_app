// // ignore_for_file: unused_import, import_of_legacy_library_into_null_safe
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyServices extends GetxService {
//   late SharedPreferences sharedPreferences;

//   Future<MyServices> init() async {
//     await Firebase.initializeApp();
//     sharedPreferences = await SharedPreferences.getInstance();
//     return this;
//   }
// }

// initialServices() async {
//   await Get.putAsync(() => MyServices().init());
// }
