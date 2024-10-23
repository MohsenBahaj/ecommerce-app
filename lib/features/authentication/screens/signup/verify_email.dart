import 'package:ecomm/common/widgets/success_screens/success_screen.dart';
import 'package:ecomm/data/repositories/authentication/authentication_repo.dart';
import 'package:ecomm/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecomm/features/authentication/screens/login/login.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () =>
                  Get.offAll(() => AuthenticationRepository.instance.logout()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                  width: AppHelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage(AppImageAsset.onBoardingImageOne)),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              )
              // Title & subTitle
              ,
              Text('check_email_title'.tr,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwItem),
              email != null
                  ? Text(email ?? '',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                      textAlign: TextAlign.center)
                  : const SizedBox(),
              const SizedBox(height: AppSizes.spaceBtwItem),
              Text('We\'ve sent you an Email to verify your email address'.tr,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItem)

              // Buttons
              ,
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         Get.off(() => SuccessScreen(
              //               image: AppImageAsset.onBoardingImageOne,
              //               title: 'signup_success_title',
              //               buttonText: 'go_to_login',
              //               subTitle: 'signup_success_message',
              //               onPressed: () {
              //                 AuthenticationRepository.instance
              //                     .screenRedirect();
              //               },
              //             ));
              //       },
              //       child: Text('onboarding.button_text'.tr)),
              // ),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: Text('resend_email'.tr)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
