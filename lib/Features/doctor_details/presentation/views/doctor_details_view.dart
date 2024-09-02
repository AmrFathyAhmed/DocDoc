import 'package:doc_doc/Features/doctor_details/presentation/views/widgets/doctor_details_view_body.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/notifaction_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../book_appointment/presentation/views/book_appointment_view.dart.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Dr Randy Wigham",
      ),
      bottomNavigationBar: MakeAnAppointmentBtn(
        text: "Make An Appointment",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const BookAppointmentView(),));
        },
      ),
      body: DoctorDetailsViewBody(
        image:
            'https://th.bing.com/th/id/OIP.T0nPc_C2Z0gtaD6sI1ryRQHaHp?rs=1&pid=ImgDetMain',
        rating: '4.8',
        name: 'Dr. Randy Wigham',
        specialization: 'General', degree: 'RSUD Gatot Subroto',
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
