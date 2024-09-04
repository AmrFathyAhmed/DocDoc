import 'package:doc_doc/Features/home/presentation/views/widgets/doctors_list_view.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/notifaction_app_bar.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/search_and_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../data/repo/home_repo_impl.dart';
import '../manger/home_cubit.dart';

class RecommendationDoctors extends StatelessWidget {
  const RecommendationDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(HomeRepoImpl())..getDoctors(token: token!),
      child: Scaffold(
        appBar: buildAppBar(context, title: "RecommendationDoctors"),
        body:  Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(height: 32.h,),
                  SearchAndFilterBar(),
                  SizedBox(height:  24.h),
                  DoctorsListView()
          ],
              ),),
        )
      ),
    );
  }
}
