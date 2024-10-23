import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/device/device_utility.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSearchContainer extends StatelessWidget {
  const AppSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBorder = true,
    this.showBackground = true,
    this.padding =
        const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });
  final String text;
  final EdgeInsetsGeometry padding;
  final IconData? icon;
  final bool showBackground, showBorder;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: AppDeviceUtility.getScreenWidth(context),
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? AppColors.dark
                    : AppColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: AppColors.grey) : null),
        child: Row(
          children: [
            const Icon(
              Iconsax.search_normal,
              color: AppColors.darkGrey,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            Text(
              'Search in Store',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
