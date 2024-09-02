
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../generated/assets.dart';

class UserBottomNavBarWidget extends StatelessWidget {
  final void Function(int)? onTap;
  final int currentIndex;

  const UserBottomNavBarWidget({
    super.key,
    this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: AppColors.white,
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 24,
        items: [
          BottomNavigationBarItem(
            tooltip: "Home",
            label: 'Home',
            activeIcon: SvgPicture.asset(
              Assets.svgsActiveHome,
            ),
            icon: SvgPicture.asset(
              Assets.svgsNavhome,
            ),
          ),
          BottomNavigationBarItem(
            tooltip: "Messages",
            label: 'Messages',
            activeIcon: Padding(
              padding: const EdgeInsets.only(right: 27.0),
              child: SvgPicture.asset(
                Assets.svgsActiveMessage,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(right: 27.0),
              child: SvgPicture.asset(
                Assets.svgsNavmessage,
              ),
            ),
          ),
          BottomNavigationBarItem(
            tooltip: "Appointment",
            label: 'Appointment',
            activeIcon: Padding(
              padding: const EdgeInsets.only(left: 27.0),
              child: SvgPicture.asset(
                Assets.svgsActiveAppointment,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(left: 27.0),
              child: SvgPicture.asset(
                Assets.svgsNavappointment,
              ),
            ),
          ),
          BottomNavigationBarItem(
            tooltip: "Profile",
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              Assets.svgsActiveProfile,
            ),
            icon: SvgPicture.asset(
              Assets.svgsNavprofile,
            ),
          ),
        ],
      ),
    );
  }
}
