import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/icons/circular_icon.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/products.cart/cart/cart_item.dart';
import 'package:ecomm/common/widgets/products.cart/cart/product_quantity_with_add_and_remove.dart';
import 'package:ecomm/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecomm/features/shop/screens/checkout/checkout.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        //cart items
        child: CartItems(),
      ),
      //checkout buttonn
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace / 2),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => CheckoutScreen());
            },
            child: Text('Checkour \$1035.0')),
      ),
    );
  }
}
