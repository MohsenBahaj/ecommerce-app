import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/common/widgets/icons/circular_icon.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_description.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/features/shop/screens/product_details/product_details.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetailScreen());
      },
      child: Container(
        width: 180,
        // height: 180, // Ensure the container has a consistent height
        decoration: BoxDecoration(
          // boxShadow: [AppShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: dark ? AppColors.darkContainer : AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Thumbnail, Wishlist button, Discount tag
            CircularContainer(
              background: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  const AppRoundedImage(
                    borderRadius: AppSizes.md,
                    height: 155,
                    imageUrl: AppImageAsset.phone3,
                    applyImageRaduis: true,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8,
                    left: 5,
                    child: CircularContainer(
                      radius: AppSizes.sm,
                      background: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AppColors.black),
                      ),
                    ),
                  ),
                  //fav icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            // Product details: Title, Description, Brand
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: 'Orange Nike $text',
                  ),
                  const ProductDescriptionText(
                    title:
                        'Orange Nike This is test product for testing overflow of the rexr',
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                  const BrandTitleWithVerifiedIcon(
                    title: 'Nikiea',
                  ),
                ],
              ),
            ),

            // Price and Add to Cart
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProductPriceText(
                    price: '35.5',
                    isLarge: false,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(AppSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                      width: AppSizes.iconLg * 1.2,
                      height: AppSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(
                          Iconsax.add,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
