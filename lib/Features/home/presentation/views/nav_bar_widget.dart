
import 'package:doc_doc/Features/home/presentation/views/widgets/user_bottom_nav_bar_widget.dart';
import 'package:doc_doc/Features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/assets.dart';
import '../../../Inbox/presentation/views/inbox_view.dart';
import '../../../my_appointment/presentation/views/my_appointment_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../data/repo/home_repo_impl.dart';
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
      InboxView(),
      MyAppointmentView(),

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView(),));
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
