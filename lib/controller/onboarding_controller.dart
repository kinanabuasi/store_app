
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constant/routes.dart';
import '../data/datasource/static/static.dart';


abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {

  late PageController pageController;

  int currentPage = 0;


  @override
  next() {
    currentPage++;

    if (currentPage > onboardinglist.length - 1) {
      //  myServices.sharedPreferences.setString("step", "1") ; 
       Get.offAllNamed(AppRoute.login) ; 
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
