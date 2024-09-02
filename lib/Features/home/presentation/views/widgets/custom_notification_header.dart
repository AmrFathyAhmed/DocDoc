
import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class CustomNotificationsHeader extends StatelessWidget {
  const CustomNotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 32, start: 24, end: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today',
            style: TextStyles.style12W500.copyWith(
              color: AppColors.rememberMe,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Mark all as read',
              style: TextStyles.style12W400.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
