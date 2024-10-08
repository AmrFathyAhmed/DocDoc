
import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class PaymentOptionItem extends StatelessWidget {
  const PaymentOptionItem({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });
  final String title;
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 6,
      dense: true,
      title: Text(
        title,
        style:  TextStyles.style14W600.copyWith(
          color: const Color(0xff212121),
        ),
      ),
      leading: Radio(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fillColor: WidgetStateProperty.all(AppColors.primary),
        activeColor: AppColors.primary,
        visualDensity: VisualDensity.compact,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
