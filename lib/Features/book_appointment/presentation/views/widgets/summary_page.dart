

import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../home/data/models/doctor_model.dart';
import 'book_item_info.dart';
import 'payment_info_list_tile.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({
    super.key,
    this.selectedDateTime,
    this.note,
    this.image,
    this.rating,
    this.paymentMethod, required this.doctor, required this.images,
  });
  final DateTime? selectedDateTime;
  final String? note;
  final String? image;
  final String? rating;
  final String? paymentMethod;
  final Doctor doctor;
  final String images;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Booking Information',
            style: TextStyles.style16W600.copyWith(
              color: const Color(0xff070C18),
            ),
          ),
          const SizedBox(height: 24),
          CustomBookInfoItem(
            title: 'Date & Time',
            subtitle: selectedDateTime != null
                ? selectedDateTime.toString()
                : 'Not selected',
            image: Assets.svgsScheduleChanged,
            backgroundColor: AppColors.scheduleChanged,
          ),
          const Divider(
            color: AppColors.textFieldBorder,
            height: 30,
          ),
          CustomBookInfoItem(
            title: 'Appointment Type',
            subtitle: note ?? 'Not selected',
            image: Assets.svgsAppointmentTypeBookInfo,
            backgroundColor: AppColors.videoCallAppointment,
          ),
          const Divider(
            color: AppColors.textFieldBorder,
            height: 30,
          ),
          const SizedBox(height: 9),
          Text(
            'Booking Information',
            style:  TextStyles.style16W600.copyWith(
              color: const Color(0xff070C18),
            ),
          ),
          const SizedBox(height: 24),
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
                  doctor.name,
                      style: TextStyles.style16W700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${doctor.specialization.name}| ${doctor.degree}",
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
                            rating!,
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
          const SizedBox(height: 32),
          Text(
            'Payment Information',
            style: TextStyles.style16W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          const SizedBox(height: 24),
          PaymentInformationListTile(
            backgroundColor: const Color(0xffF1F1F1),
            btnText: 'Change',
            image: Assets.svgsSmallMoneyIconSvg,
            subtitle: '***** ***** ***** 37842',
            title: paymentMethod ?? 'Not selected',
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Total',
                style: TextStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
              Text(
                '\$400',
                style: TextStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
