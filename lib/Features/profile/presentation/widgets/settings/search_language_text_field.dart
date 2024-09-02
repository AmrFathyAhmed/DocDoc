

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/assets.dart';

class SearchForLanguageTextField extends StatelessWidget {
  const SearchForLanguageTextField({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        fillColor: AppColors.notificationTile,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        hintStyle: TextStyles.style12W500.copyWith(
          color: AppColors.rememberMe,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            Assets.svgsNavSearch,
            colorFilter: const ColorFilter.mode(
              AppColors.rememberMe,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
