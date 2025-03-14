import 'package:ecomm/features/personalization/screens/settings/settings.dart';
import 'package:ecomm/features/shop/screens/home/home.dart';
import 'package:ecomm/features/shop/screens/store/store.dart';
import 'package:ecomm/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            backgroundColor: dark ? AppColors.black : Colors.white,
            indicatorColor: dark
                ? Colors.white.withOpacity(0.1)
                : AppColors.black.withOpacity(0.1),
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'WishList'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = const [
    HomeScreen(),
    Store(),
    FavouriteScreen(),
    SettingsScreen()
  ];
}
