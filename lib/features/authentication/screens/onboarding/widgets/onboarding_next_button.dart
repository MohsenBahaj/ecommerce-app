import 'package:ecomm/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/device/device_utility.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: AppDeviceUtility.getBottomNavigationBarHieght(),
        right: AppSizes.defaultSpace,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(
                    side: BorderSide(color: Colors.transparent)),
                backgroundColor: dark ? AppColors.primary : AppColors.black),
            onPressed: () => OnBoardingController.instance.nextPage(),
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
            )));
  }
}
