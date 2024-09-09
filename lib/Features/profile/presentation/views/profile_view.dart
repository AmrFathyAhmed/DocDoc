
import 'package:dio/dio.dart';
import 'package:doc_doc/Features/home/presentation/Cubits/user_cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/assets.dart';
import '../widgets/profile/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => UserCubit(Dio())..fetchUser(),
        child: Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            surfaceTintColor: Colors.transparent,
            title: Text(
              'Profile',
              style: TextStyles.style18W600.copyWith(
                color: AppColors.white,
              ),
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: SvgPicture.asset(
                    Assets.svgsSetting,
                  ),
                ),
              ),
            ],
            leading: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.white,
              size: 20,
            ),
          ),
          body: const ProfileViewBody(),
        ),
      ),
    );
  }
}
