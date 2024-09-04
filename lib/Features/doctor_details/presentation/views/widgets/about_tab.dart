
import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../home/data/models/doctor_model.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key, required this.doctor,});
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About me',
              style: TextStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Dr. ${doctor.name}is a dedicated ${doctor.degree} with a specialization in ${doctor.specialization.name}. They are committed to providing compassionate and patient-centered care, utilizing the latest advancements in medical science to achieve optimal health outcomes.\n\n${doctor.name} believes in building strong relationships with their patients, fostering open communication, and empowering them to take an active role in their health journey.",
              style: TextStyles.style14W400,
            ),
            const SizedBox(height: 24),
            Text(
              'Working Time',
              style: TextStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Monday - Friday, ${doctor.startTime} - ${doctor.endTime}',
              style: TextStyles.style14W400,
            ),
            const SizedBox(height: 24),
            Text(
              'Contact Details',
              style: TextStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              doctor.phone,
              style:TextStyles.style14W400,
            ),
            const SizedBox(height: 12),
            Text(
              doctor.email,
              style: TextStyles.style14W400,
            ),
            const SizedBox(height: 24),
            Text(
              'Appointment Price',
              style: TextStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
             doctor.appointPrice.toString() ,
              style: TextStyles.style14W400,
            ),
          ],
        ),
      ),
    );
  }
}
