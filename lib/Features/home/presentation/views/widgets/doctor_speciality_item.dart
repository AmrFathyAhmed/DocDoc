
import 'package:flutter/material.dart';

import '../../../../../core/costant/specialityList.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({
    super.key,
    required this.index,
  });


  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 80,
              minWidth: 80,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(100),
              color: AppColors.primary.withOpacity(0.05),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: Center(
                child: Image.asset(
                  specialityList.elementAt(index).image,
                  height: 40,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
            specialityList.elementAt(index).name,
              style: TextStyles.style12W400.copyWith(
                color: AppColors.black2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
