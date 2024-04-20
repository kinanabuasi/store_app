// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/screen/cart.dart';
import 'package:store_app/screen/details/details_screen.dart';
import 'package:store_app/screen/details/productdetails.dart';
import 'package:store_app/screen/home/home_screen.dart';
import 'package:store_app/screen/myfavorite.dart';
import 'package:store_app/screen/onboarding.dart';
import 'constant/imageasset.dart';
import 'constant/routes.dart';
import 'data/model/Product.dart';
import 'screen/auth/login.dart';
import 'screen/auth/signup.dart';
import 'screen/items/items_view.dart';
import 'test.dart';

// import 'package:p1/test.dart';
List<GetPage<dynamic>>? routes = [
  // GetPage(
  // name: "/signup",
  // page: () => Login(),
  // page: () => SignUp(),
  // ),
  GetPage(name: "/", page: () =>  OnBoarding()),
  GetPage(name: AppRoute.signUp, page: () =>SignUp()),
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.HomeScreen, page: () => HomeScreen()),
  GetPage(name: AppRoute.items, page: () => items_view()),
  GetPage(name: AppRoute.test, page: () => test()),
  GetPage(name: AppRoute.myfavroite, page: () => MyFavorite()),
  GetPage(name: AppRoute.ProductDetails, page: () => ProductDetails()),
  GetPage(name: AppRoute.cart, page: () => Cart()),
];

// Map<String, Widget Function(BuildContext)> routes = {
//   "/login": (context) =>  Login() ,
//   "/signup": (context) => SignUp() ,
//   AppRoute.onBoarding: (context) => const OnBoarding() ,
//   AppRoute.forgetpass:(context) => const ForgetPass(),
//   "/resetPass":(context) => const ResetPassword(),
//   AppRoute.verfiyCode:(context) => const VerifyCode(),
// };
