import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/costant/doctor_images.dart';
import '../../../../home/data/models/doctor_model.dart';
import '../../../../home/presentation/views/widgets/doctors_list_view_item.dart';


class DoctorsListView2 extends StatelessWidget {
  const DoctorsListView2({super.key, required this.doctors});
  final List<Doctor> doctors;
  @override
  Widget build(BuildContext context) {
    final random = Random();

    int randomIndex = random.nextInt(doctorImages.length-1);
    return ListView.builder(
            itemCount:  doctors.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DoctorsListViewItem(
                doctor: doctors[index], images: doctorImages[randomIndex],
              );
            },
          );


  }
}
