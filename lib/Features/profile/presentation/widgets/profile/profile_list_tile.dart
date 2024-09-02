
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.image,
    required this.backgroundColor,
    this.onTap,
    this.colorFilter,
  });

  final String title;
  final String image;
  final Color backgroundColor;
  final void Function()? onTap;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            title: Text(
              title,
              style: TextStyles.style14W400.copyWith(
                color: AppColors.black2,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Container(
                constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
                padding: const EdgeInsetsDirectional.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: backgroundColor,
                ),
                child: SvgPicture.asset(
                  image,
                  colorFilter: colorFilter,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),

        ],
      ),
    );
  }
}
