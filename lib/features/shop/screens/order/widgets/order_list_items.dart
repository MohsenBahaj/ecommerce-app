import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) {
        return SizedBox(
          height: AppSizes.spaceBtwItem,
        );
      },
      itemCount: 4,
      itemBuilder: (_, index) => CircularContainer(
        padding: EdgeInsets.all(AppSizes.md),
        showBorder: true,
        background: dark ? AppColors.dark : AppColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                //icon
                Icon(Iconsax.ship),
                SizedBox(
                  width: AppSizes.spaceBtwItem / 2,
                ),
                // status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Proccessing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: AppColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '28 Nov 2024',
                        style: Theme.of(context).textTheme.headlineSmall!,
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.arrow_right_34,
                      size: AppSizes.iconSm,
                    ))
              ],
            ),
            //Row 2
            const SizedBox(
              height: AppSizes.spaceBtwItem,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      //icon
                      Icon(Iconsax.ship),
                      SizedBox(
                        width: AppSizes.spaceBtwItem / 2,
                      ),
                      // status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text(
                              '[#2561785]',
                              style: Theme.of(context).textTheme.headlineSmall!,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      //icon
                      Icon(Iconsax.ship),
                      SizedBox(
                        width: AppSizes.spaceBtwItem / 2,
                      ),
                      // status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text(
                              '03 Feb 2024',
                              style: Theme.of(context).textTheme.headlineSmall!,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
