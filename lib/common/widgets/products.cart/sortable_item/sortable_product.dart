import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products.cart/product_cards.dart/product_card_vertical.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              "Name",
              "Higher Price",
              "Lower Price",
              "Sale",
              "Newest",
              "Popularity",
            ]
                .map((element) =>
                    DropdownMenuItem(value: element, child: Text(element)))
                .toList(),
            onChanged: (val) {}),
        SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        GridLayout(
            itemCount: 10,
            itemBuilder: (__, index) {
              return ProductCardVertical(product: ProductModel.empty());
            })
      ],
    );
  }
}
