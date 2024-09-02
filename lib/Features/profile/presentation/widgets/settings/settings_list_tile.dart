
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.image,
    this.textColor,
  });
  final void Function()? onTap;
  final String title;
  final String image;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            visualDensity: VisualDensity.compact,
            title: Text(
              title,
              style: TextStyles.style14W400.copyWith(
                color: textColor ?? AppColors.black2,
              ),
            ),
            leading: SvgPicture.asset(
              image,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.black2,
              size: 16,
            ),
          ),
          const Divider(
            color: AppColors.textFieldBorder,
          ),
        ],
      ),
    );
  }
}
