import 'package:doc_doc/Features/auth/presentation/views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../logout_cubit/logout_cubit.dart';
import '../../logout_cubit/logout_state.dart'; // import the cubit file

class LogOutDialog extends StatelessWidget {
  final String token; // Token to be passed to the logout function

  const LogOutDialog({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(Dio()), // Provide Dio instance to LogoutCubit
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView(),));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logout Successful'),
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is LogoutFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          return CupertinoAlertDialog(
            title: Text(
              'Logout',
              style: TextStyles.style16W600.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Text(
                'You’ll need to enter your email\nand password next time\nyou want to auth',
                style: TextStyles.style12W400.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
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
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: state is LogoutLoading
                    ? CupertinoActivityIndicator() // Show loading indicator while logging out
                    : Text(
                  'Log Out',
                  style: TextStyles.style14W400.copyWith(
                    color: const Color(0xffFF0000),
                    fontSize: 16,
                  ),
                ),
                onPressed: state is LogoutLoading
                    ? null
                    : () {
                  BlocProvider.of<LogoutCubit>(context).logout(token);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
