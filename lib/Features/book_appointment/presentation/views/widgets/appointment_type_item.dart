
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

ListTile appointmentTypeItem({
  required String title,
  required String value,
  required String image,
  required String? groupValue,
  required void Function(String?)? onChanged,
  required Color? backgroundColor,
}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Container(
      constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
      ),
      child: SvgPicture.asset(
        image,
      ),
    ),
    title: Text(
      title,
      style: TextStyles.style14W400.copyWith(color: AppColors.black2),
    ),
    trailing: Radio(
      value: value,
      groupValue: groupValue,
      activeColor: AppColors.primary,
      onChanged: onChanged,
      fillColor: WidgetStateProperty.all(AppColors.primary),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
  );
}
