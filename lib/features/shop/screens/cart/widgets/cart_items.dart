import 'package:ecomm/common/widgets/products.cart/cart/cart_item.dart';
import 'package:ecomm/common/widgets/products.cart/cart/product_quantity_with_add_and_remove.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddREmoveButton = true,
  });
  final bool showAddREmoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Column(
            children: [
              const AppCartItem(),
              if (showAddREmoveButton)
                SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showAddREmoveButton
                      ? ProductQuantityWithAddAndRemove()
                      : SizedBox(),
                  ProductPriceText(price: '260')
                ],
              )
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
        itemCount: 2);
  }
}
