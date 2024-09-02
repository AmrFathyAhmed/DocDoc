import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';


class StepCircle extends StatelessWidget {
  final bool isActive;
  final String stepLabel;
  final int stepNumber;
  final bool isCompleted;
  const StepCircle({
    super.key,
    required this.isActive,
    required this.stepLabel,
    required this.stepNumber,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: isCompleted
              ? AppColors.steppergreen
              : (isActive ? AppColors.primary : AppColors.stepperGrey),
          child: Text(
            "$stepNumber",
            style:  TextStyles.style12W500.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          stepLabel,
          style:  TextStyles.style12W400.copyWith(
            color: isCompleted
                ? AppColors.steppergreen
                : (isActive ? AppColors.black2 : AppColors.rememberMe),
          ),
        ),
      ],
    );
  }
}
