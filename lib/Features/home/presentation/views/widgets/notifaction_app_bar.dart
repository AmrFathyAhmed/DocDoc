
import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

PreferredSizeWidget buildAppBar(
  context, {
  required String title,
  Widget? trailing,
}) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    leadingWidth: 60,
    leading: GestureDetector(
      onTap: () {Navigator.pop(context);},
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
          margin: const EdgeInsetsDirectional.only(start: 16, top: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: AppColors.white,
            border: Border.all(
              color: AppColors.textFieldBorder,
              width: 1,
            ),
          ),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.black2,size: 20,
          ),
        ),
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: TextStyles.style18W600.copyWith(
          color: AppColors.black2,
        ),
      ),
    ),
    actions: [
      if (trailing != null) trailing,
    ],
  );
}
