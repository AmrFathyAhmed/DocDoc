import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/costant/doctor_images.dart';
import '../../../../../core/theming/colors.dart';
import '../../Cubits/specaility_doctors_cubit/specaility_doctors_cubit.dart';
import '../../Cubits/specaility_doctors_cubit/specaility_doctors_state.dart';
import 'doctors_list_view_item.dart';

class SpecialityAllDoctorsListview extends StatelessWidget {
  const SpecialityAllDoctorsListview ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialityDoctorCubit, SpecialityDoctorState>(
      builder: (context, state) {
        if (state is SpecialityDoctorLoading) {
          return SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(color: ColorsManager.mainBlue),
            ),
          );
        } else if (state is SpecialityDoctorFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (state is SpecialityDoctorSuccess) {
          return ListView.builder(
            itemCount:  state.doctors.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {

              final random = Random();  // Create a Random object
              int randomIndex = random.nextInt(doctorImages.length-1);
              return DoctorsListViewItem(
                doctor: state.doctors[index], images: doctorImages[randomIndex],
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
