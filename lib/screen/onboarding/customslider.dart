
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constants.dart';
import '../../controller/onboarding_controller.dart';
import '../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onboardinglist.length,
        itemBuilder: (context, i) => ListView(
              children: [
                Image.asset(
                  onboardinglist[i].image!,
                  // width: ,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 60),
                Center(
                  child: Text(onboardinglist[i].title!,
                      style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColor.black)),
                ),
                const SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onboardinglist[i].body!,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                          height: 2,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )),
              ],
            ));
  }
}
