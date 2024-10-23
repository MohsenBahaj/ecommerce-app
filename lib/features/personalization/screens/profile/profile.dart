import 'package:ecomm/common/widgets/shimmers/shimmer.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/texts/head_section.dart';
import 'package:ecomm/features/personalization/controllers/user_controller.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/edit_name.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : AppImageAsset.logoDark;
                      return controller.profileLoading.value
                          ? AppShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : AppRoundedImage(
                              imageUrl: image,
                              borderRadius: 100,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () {
                        controller.uploadImageProfilePicture();
                      },
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem / 2,
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItem),
              const AppSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItem),
              ProfileMenu(
                onPressed: () {
                  Get.to(() => ChanegName());
                },
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItem),
              const AppSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItem),
              ProfileMenu(
                icon: Iconsax.copy,
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: controller.user.value.email,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '23 Oct 2002',
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItem),
              TextButton(
                  onPressed: () => controller.deleteAccountWarringPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
