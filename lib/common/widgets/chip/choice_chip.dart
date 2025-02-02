import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final Color? chipColor = AppHelperFunctions.getColor(text);
    final isColor = chipColor != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
          label: isColor ? const SizedBox.shrink() : Text(text),
          selected: selected,
          labelStyle: TextStyle(color: selected ? AppColors.white : null),
          onSelected: onSelected,
          shape: isColor ? const CircleBorder() : null,
          avatar: isColor
              ? CircularContainer(
                  width: 50,
                  height: 50,
                  background: chipColor,
                )
              : null,
          backgroundColor: isColor ? chipColor : null,
          selectedColor: isColor ? chipColor : null,
          padding: isColor ? EdgeInsets.zero : null,
          labelPadding: isColor ? EdgeInsets.zero : null),
    );
  }
}
