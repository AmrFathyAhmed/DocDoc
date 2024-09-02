
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return
      CupertinoAlertDialog(
                title: Text(
                  'Logout',
                  style: TextStyles.style16W600.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                content: Text(
                  'You’ll need to enter your email\nand password next time\nyou want to auth',
                  style: TextStyles.style12W400.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      'Cancel',
                      style: TextStyles.style14W400.copyWith(
                        color: const Color(0xff007AFF),
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                     // context.pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      'Log Out',
                      style: TextStyles.style14W400.copyWith(
                        color: const Color(0xffFF0000),
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                    },
                  ),
                ],
      );
  }
}
