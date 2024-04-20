
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/constants.dart';
import '../controller/onboarding_controller.dart';
import 'onboarding/custombutton.dart';
import 'onboarding/customslider.dart';
import 'onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding(),
                  ],
                ))
          ]),
        ));
  }
}
