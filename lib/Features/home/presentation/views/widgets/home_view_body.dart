import 'package:doc_doc/Features/home/presentation/views/recommendation_doctors.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/doctor_blue_container.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/doctors_list_view.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/doctors_speciality_see_all.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../doctor_speciality_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 12.h),
                  HomeTopBar(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: DoctorsBlueContainer(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 24.h),
                  DoctorsSpecialitySeeAll(
                    title: "Doctor Speciality",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorSpecialityView(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SpecialityListView(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 22.h),
                  DoctorsSpecialitySeeAll(
                    title: "Recommendation Doctor",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecommendationDoctors(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: DoctorsListView(),
            ),
          ),
        ],
      ),
    );
  }
}
