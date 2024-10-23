import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/products.cart/product_cards.dart/product_card_horizontal.dart';
import 'package:ecomm/common/widgets/texts/head_section.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Sports shirts',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppRoundedImage(
                imageUrl: AppImageAsset.banner3,
              ),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              Column(
                children: [
                  AppSectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        separatorBuilder: (_, __) {
                          return const SizedBox(
                            width: AppSizes.spaceBtwItem,
                          );
                        },
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ProductHorizontalCard();
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
