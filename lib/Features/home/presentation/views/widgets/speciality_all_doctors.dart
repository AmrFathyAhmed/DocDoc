import 'package:doc_doc/Features/home/presentation/Cubits/specaility_doctors_cubit/specaility_doctors_cubit.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/doctors_list_view.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/notifaction_app_bar.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/search_and_filter_bar.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/specaility_all_doctors_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../data/repo/home_repo_impl.dart';
import '../../Cubits/recommended_doctors_cubit/home_cubit.dart';



class SpecialityAllDoctors extends StatelessWidget {
  const SpecialityAllDoctors({Key? key, required this.index, required this.sName}) : super(key: key);
final int index;
final String sName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialityDoctorCubit(HomeRepoImpl())..getSpecialityDoctors(token: token!,id: index),
      child: Scaffold(
          appBar: buildAppBar(context, title: "${sName}Doctors"),
          body:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 32.h,),
                  SearchAndFilterBar(),
                  SizedBox(height:  24.h),
                  SpecialityAllDoctorsListview()
                ],
              ),),
          )
      ),
    );
  }
}
