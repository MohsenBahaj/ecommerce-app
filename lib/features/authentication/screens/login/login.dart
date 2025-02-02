import 'package:ecomm/common/widgets/widgets_login_signup/form_divider.dart';
import 'package:ecomm/common/widgets/widgets_login_signup/social_buttons.dart';
import 'package:ecomm/features/authentication/controllers/login/login_controller.dart';
import 'package:ecomm/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecomm/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ecomm/common/styles/spacing_style.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo, Title and subTitle
              LoginHeader(),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              LoginForm(),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              )
              //Divider
              ,
              FormDivider(
                text: 'sign_up_with',
              ),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
