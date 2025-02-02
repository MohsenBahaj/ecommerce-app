import 'package:ecomm/common/widgets/widgets_login_signup/form_divider.dart';
import 'package:ecomm/common/widgets/widgets_login_signup/social_buttons.dart';
import 'package:ecomm/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                'sign_up'.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const SignUpForm(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              FormDivider(text: 'sign_up_with'.tr.capitalize!)
              //social buttons
              ,
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const SocialButtons(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
