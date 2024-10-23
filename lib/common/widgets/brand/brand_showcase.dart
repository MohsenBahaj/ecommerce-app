import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/common/widgets/products.cart/product_cards.dart/brandCard.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      background: Colors.transparent,
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItem),
      child: Column(
        children: [
          //Brand With Product Counts
          const BrandCard(
            showBorder: false,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItem,
          )
          // Brand (Top three products)
          ,
          Row(
              children:
                  images.map((image) => _showBrand(context, image)).toList())
        ],
      ),
    );
  }

  Widget _showBrand(BuildContext context, String image) {
    return Expanded(
      child: CircularContainer(
        height: 110,
        background: AppHelperFunctions.isDarkMode(context)
            ? AppColors.darkGrey
            : AppColors.light,
        margin: const EdgeInsets.only(right: AppSizes.sm),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppSizes.cardRadiusLg,
          ),
          child: Image(fit: BoxFit.cover, image: AssetImage(image)),
        ),
      ),
    );
  }
}
