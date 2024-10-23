import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/curved_edge/curved_edge_widget.dart';
import 'package:ecomm/common/widgets/icons/circular_icon.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailImageSlider extends StatelessWidget {
  const ProductDetailImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return CustomClipPath(
      child: Container(
        color: dark ? AppColors.darkGrey : AppColors.white,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.productImageRadius),
                child: Center(
                  child: AppRoundedImage(
                    imageUrl: AppImageAsset.watch1,
                    borderRadius: 5,
                  ),
                ),
              ),
            ),
            //Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, __) {
                    return AppRoundedImage(
                      bakcgroundColor: dark ? AppColors.dark : AppColors.white,
                      imageUrl: AppImageAsset.watch1,
                      border: Border.all(color: AppColors.primary),
                      borderRadius: 10,
                      width: 80,
                      height: 70,
                    );
                  },
                  separatorBuilder: (_, int index) {
                    return const SizedBox(
                      width: AppSizes.spaceBtwItem,
                    );
                  },
                  itemCount: 8,
                ),
              ),
            ),
            const CustomAppBar(
              showBackArrow: true,
              action: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
