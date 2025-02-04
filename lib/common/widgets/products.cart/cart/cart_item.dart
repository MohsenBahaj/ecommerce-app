import 'package:ecomm/common/widgets/icons/circular_icon.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppRoundedImage(
            width: 60,
            padding: EdgeInsets.all(AppSizes.sm),
            height: 60,
            imageUrl: AppImageAsset.google,
            borderRadius: 10),
        const SizedBox(
          width: AppSizes.spaceBtwItem,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(
                title: 'Nile',
              ),
              const Flexible(
                child: ProductTitleText(
                  title: 'Black Sport shoes test',
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color : ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Green',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: ' Size : ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'UE 28',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
