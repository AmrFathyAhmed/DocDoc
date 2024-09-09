import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/costant/doctor_images.dart';
import '../../../../../core/theming/colors.dart';
import '../../Cubits/recommended_doctors_cubit/home_cubit.dart';
import '../../Cubits/recommended_doctors_cubit/home_state.dart';
import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(color: ColorsManager.mainBlue),
            ),
          );
        } else if (state is HomeFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (state is HomeSuccess) {
          return ListView.builder(
            itemCount:  doctorImages.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DoctorsListViewItem(
                doctor: state.doctors[index], images: doctorImages[index],
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
