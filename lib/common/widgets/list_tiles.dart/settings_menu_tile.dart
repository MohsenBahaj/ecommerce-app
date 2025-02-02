import 'package:ecomm/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppSettingMenuTile extends StatelessWidget {
  const AppSettingMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      this.trailing,
      required this.subTitle,
      this.onTap});
  final IconData icon;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
