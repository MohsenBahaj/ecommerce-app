import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/features/shop/screens/order/widgets/order_list_items.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Order',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: OrderListItem(),
      ),
    );
  }
}
