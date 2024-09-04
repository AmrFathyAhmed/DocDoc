
import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/payment_info_list_tile.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../generated/assets.dart';
import '../../../../doctor_details/presentation/views/doctor_details_view.dart';
import '../../../../home/data/models/doctor_model.dart';
import '../../../../home/presentation/views/widgets/notifaction_app_bar.dart';
import 'book_item_info.dart';

class BookingDetailsView extends StatelessWidget {
  const BookingDetailsView({super.key, required this.doctor, required this.images,  required this.note, this.selectedDateTime});
  final Doctor doctor;
  final String images;
  final DateTime? selectedDateTime;
  final String note;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context, title: "Booking Details"),
      bottomNavigationBar: MakeAnAppointmentBtn(
        onPressed: () {
          Navigator.pop(context);
        },
        text: "Done",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 27, end: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Align(
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 65,
                ),
              ),
              const SizedBox(height: 27),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Booking Confirmed",
                  style: TextStyles.style20W500,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Booking Information",
                style: TextStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
              const SizedBox(height: 24),
              CustomBookInfoItem(
                title: 'Date & Time',
                subtitle: selectedDateTime.toString(),
                image: Assets.svgsScheduleChanged,
                backgroundColor: AppColors.scheduleChanged,
              ),
              const Divider(
                color: AppColors.textFieldBorder,
                height: 30,
              ),
              PaymentInformationListTile(
                backgroundColor: AppColors.videoCallAppointment,
                btnText: 'Get Location',
                image: Assets.svgsAppointmentTypeBookInfo,
                subtitle: note,
                title: 'Appointment Type',
              ),
              const Divider(
                color: AppColors.textFieldBorder,
                height: 30,
              ),
              const SizedBox(height: 10),
              Text(
                "Doctor Information",
                style: TextStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(12),
                    child: Image.network(
                      images,
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name!,
                          style: TextStyles.style16W700,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${doctor.specialization!.name} | ${doctor.degree}",
                          style: TextStyles.style12W500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.ratingStart,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "4.3",
                                style: TextStyles.style12W500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
