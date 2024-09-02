import 'package:doc_doc/Features/home/presentation/views/widgets/doctor_speciality_view_body.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/notifaction_app_bar.dart';


import 'package:flutter/material.dart';

class DoctorSpecialityView extends StatelessWidget {
  const DoctorSpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Doctor Speciality",
      ),
      body: const DoctorSpecialityViewBody(),
    );
  }
}
