import 'package:doc_doc/Features/doctor_details/presentation/views/widgets/doctor_details_view_body.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/notifaction_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../book_appointment/presentation/views/book_appointment_view.dart.dart';
import '../../../home/data/models/doctor_model.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor, required this.images});
  final Doctor doctor;
  final String images;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Dr. ${doctor.name}',
      ),
      bottomNavigationBar: MakeAnAppointmentBtn(
        text: "Make An Appointment",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  BookAppointmentView(images: images,doctor: doctor,),));
        },
      ),
      body: DoctorDetailsViewBody(
        image:
            images,
        rating: '4.8',
        name: 'Dr. ${doctor.name}',
        specialization: doctor.specialization.name, degree: doctor.degree, doctor: doctor,
      ),
    );
  }
}

class MakeAnAppointmentBtn extends StatelessWidget {
  const MakeAnAppointmentBtn({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: const EdgeInsetsDirectional.only(start: 24, end: 24, bottom: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 52),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyles.style16W600,
        ),
      ),
    );
  }
}
