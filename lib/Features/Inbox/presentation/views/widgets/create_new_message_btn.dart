import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../generated/assets.dart';



class CreateNewMessageBtn extends StatelessWidget {
  const CreateNewMessageBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        margin: const EdgeInsetsDirectional.only(
            start: 16, top: 5, bottom: 5, end: 16),
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: AppColors.white,
          border: Border.all(
            color: AppColors.textFieldBorder,
            width: 1,
          ),
        ),
        child: SvgPicture.asset(
          Assets.svgsMessageAdd,
        ),
      ),
    );
  }
}
