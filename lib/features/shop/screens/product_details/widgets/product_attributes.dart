import 'package:ecomm/common/widgets/chip/choice_chip.dart';
import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/common/widgets/texts/head_section.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircularContainer(
          padding: const EdgeInsets.all(AppSizes.md),
          background: dark ? AppColors.darkGrey : AppColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const AppSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBtwItem,
                  ),
                  const ProductTitleText(
                    title: 'Price : ',
                    smallSize: true,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$25',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: AppSizes.spaceBtwItem,
                      ),
                      const ProductPriceText(price: '20'),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 1.5,
                  ),
                  const ProductTitleText(title: 'Status : '),
                  Text(
                    'In Stock',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const ProductTitleText(
                title:
                    'This is the description of the product and it can gp up to max four line',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem,
        ),
        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(height: AppSizes.spaceBtwItem / 2),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(
                    text: 'green', selected: false, onSelected: (val) {}),
                AppChoiceChip(
                    text: 'yellow', selected: true, onSelected: (val) {}),
                AppChoiceChip(
                    text: 'blue', selected: false, onSelected: (val) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            const SizedBox(height: AppSizes.spaceBtwItem / 2),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(
                    text: 'EU 43', selected: true, onSelected: (val) {}),
                AppChoiceChip(
                    text: 'Eu 36', selected: false, onSelected: (val) {}),
                AppChoiceChip(
                    text: 'EY 38', selected: false, onSelected: (val) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
