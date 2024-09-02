
import '../../../../../core/theming/colors.dart';
import 'info_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileInfoSheet extends StatelessWidget {
  const CustomProfileInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),

        ),
      ),
    );
  }
}
