import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price and salse price
        Row(
          children: [
            CircularContainer(
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
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            //Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            const ProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        )

        /// title

        ,
        const SizedBox(
          height: AppSizes.spaceBtwItem / 1.5,
        ),
        const ProductTitleText(title: 'Green Nike Sports Shirt'),

        /// stack status
        Row(
          children: [
            const SizedBox(
              height: AppSizes.spaceBtwItem / 1.5,
            ),
            const ProductTitleText(title: 'Status'),
            Text(
              'In Stock',
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
                    imageUrl: AppImageAsset.facebook,
                    borderRadius: 10,
                    width: 32,
                    height: 32,
                    overlayColor: AppHelperFunctions.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwItem / 1.5,
              ),
              const Expanded(
                  flex: 10, child: BrandTitleWithVerifiedIcon(title: 'Nike'))
            ],
          ),
        )
      ],
    );
  }
}
