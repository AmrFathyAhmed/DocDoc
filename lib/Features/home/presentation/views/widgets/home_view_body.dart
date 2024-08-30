import 'package:doc_doc/Features/home/presentation/views/widgets/doctor_blue_container.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/doctors_list_view.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/doctors_speciality_see_all.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 12.h,),
            HomeTopBar(),
            DoctorsBlueContainer(),
            SizedBox(height: 24.h,),
            DoctorsSpecialitySeeAll(title: "Doctor Speciality",),
            SizedBox(height: 16.h,),
            SpecialityListView(),
            SizedBox(height: 22.h,),
            DoctorsSpecialitySeeAll(title: "Recommendation Doctor",),
            SizedBox(height: 16.h,),
            DoctorsListView()

          ],
        ),
      ),
    ));
  }
}
