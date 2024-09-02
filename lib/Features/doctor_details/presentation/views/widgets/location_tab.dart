
import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/assets.dart';

class LocationTab extends StatelessWidget {
  const LocationTab({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Practice Place',
              style: TextStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Cairo, Egypt",
              style: TextStyles.style14W400,
            ),
            const SizedBox(height: 24),
            Text(
              'Location Map',
              style: TextStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            Image.asset(
              Assets.imagesLocationMap,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
