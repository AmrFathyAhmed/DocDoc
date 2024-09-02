
import 'package:doc_doc/Features/home/presentation/views/widgets/user_bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../generated/assets.dart';
import '../../../profile/presentation/views/profile_view.dart';
import 'home_view.dart';

class UserMainLayoutScreen extends StatefulWidget {
  const UserMainLayoutScreen({super.key});

  @override
  State<UserMainLayoutScreen> createState() => _UserMainLayoutScreenState();
}

class _UserMainLayoutScreenState extends State<UserMainLayoutScreen> {
  int currentIndex = 0;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeView(),
      HomeView(),
      HomeView(),

      ProfileView(),



    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: CustomFabLocation(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search',
        onPressed: () {
        },
        backgroundColor: AppColors.primary,
        elevation: 0,

        clipBehavior: Clip.none,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(24),
        ),
        child: Container(
         height: 72.h,

          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20),
            color: AppColors.primary,
          ),
          child: SizedBox( height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(
              Assets.svgsNavSearch,


            ),
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: UserBottomNavBarWidget(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
class CustomFabLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    double x = scaffoldGeometry.scaffoldSize.width / 2 - scaffoldGeometry.floatingActionButtonSize.width / 2;
    double y = scaffoldGeometry.scaffoldSize.height - scaffoldGeometry.floatingActionButtonSize.height - 33.h; // Adjust the height as needed
    return Offset(x, y);
  }
}
