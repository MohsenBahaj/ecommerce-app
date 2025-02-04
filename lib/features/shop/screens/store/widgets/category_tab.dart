import 'package:ecomm/common/widgets/brand/brand_showcase.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products.cart/product_cards.dart/product_card_vertical.dart';
import 'package:ecomm/common/widgets/texts/head_section.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //Brand
              const BrandShowcase(
                images: [
                  AppImageAsset.watch1,
                  AppImageAsset.phone4,
                  AppImageAsset.perfume2
                ],
              ),

              const SizedBox(
                height: AppSizes.spaceBtwItem,
              )
              //Products
              ,
              const AppSectionHeading(
                title: 'You Might Like ',
                showActionButton: true,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return ProductCardVertical(
                      product: ProductModel.empty(),
                    );
                  })
            ],
          ),
        ),
      ],
    );
  }
}
