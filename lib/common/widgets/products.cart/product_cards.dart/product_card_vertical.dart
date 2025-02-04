import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/common/widgets/icons/circular_icon.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_description.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/features/shop/controllers/product/product_controller.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:ecomm/features/shop/screens/product_details/product_details.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    final salePercentage =
        controller.claculateSalePercentage(product.price, product.salePrice);

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(
              product: product,
            ));
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
              background: dark ? AppColors.light : AppColors.darkContainer,
              child: Stack(
                children: [
                  Center(
                    child: AppRoundedImage(
                      borderRadius: AppSizes.md,
                      height: 180,
                      width: (size.width / 2) - 20,
                      imageUrl: product.thumbnail,
                      applyImageRaduis: true,
                      fit: BoxFit.cover,
                      isNetworkImage: true,
                    ),
                  ),
                  if (salePercentage != null)
                    Positioned(
                      top: 8,
                      left: 5,
                      child: CircularContainer(
                        radius: AppSizes.sm,
                        background: AppColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.sm, vertical: AppSizes.xs),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: AppColors.black),
                        ),
                      ),
                    ),
                  //fav icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: product.isFeatured ? Colors.red : AppColors.grey,
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
                    title: product.title,
                  ),
                  ProductDescriptionText(
                    title: product.description,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                  BrandTitleWithVerifiedIcon(
                    title: product.brand.name,
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
                  Flexible(
                    child: Column(
                      children: [
                        if (product.productType ==
                                ProductType.single.toString() &&
                            product.salePrice > 0)
                          Padding(
                            padding: EdgeInsets.only(left: AppSizes.sm),
                            child: Text(product.price.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(
                                        decoration:
                                            TextDecoration.lineThrough)),
                          ),
                        Padding(
                          padding: EdgeInsets.only(left: AppSizes.sm),
                          child: ProductPriceText(
                              price: controller.getProductPrice(product)),
                        )
                      ],
                    ),
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
                    child: GestureDetector(
                      onTap: () {},
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
