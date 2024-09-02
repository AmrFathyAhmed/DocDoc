import 'package:doc_doc/Features/home/presentation/views/widgets/doctors_list_view.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/notifaction_app_bar.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/search_and_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctors extends StatelessWidget {
  const RecommendationDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
