import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/icons/circular_icon.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products.cart/product_cards.dart/product_card_vertical.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:ecomm/features/shop/screens/home/home.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: false,
        action: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                  itemCount: 8,
                  itemBuilder: (_, index) {
                    return ProductCardVertical(
                      product: ProductModel.empty(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
