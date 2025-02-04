import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/features/shop/controllers/product/product_controller.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.claculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price and salse price
        Row(
          children: [
            if (salePercentage != null)
              CircularContainer(
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
            if (salePercentage != null)
              const SizedBox(
                width: AppSizes.spaceBtwItem,
              ),
            //Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            ProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        )

        /// title

        ,
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        ProductTitleText(title: product.title),

        /// stack status
        Row(
          children: [
            const SizedBox(
              height: AppSizes.spaceBtwItem / 1.5,
            ),
            const ProductTitleText(title: 'Status     '),
            Text(
              controller
                  .getProductStockStatus(int.tryParse(product.stock) ?? 0),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        )

        /// Brand
        ,
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        SizedBox(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: AppRoundedImage(
                    imageUrl: product.brand.image,
                    borderRadius: 10,
                    isNetworkImage: true,
                    width: 32,
                    height: 32,
                    overlayColor: AppHelperFunctions.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwItem / 1.5,
              ),
              Expanded(
                  flex: 10,
                  child: BrandTitleWithVerifiedIcon(
                    title: product.brand.name,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
