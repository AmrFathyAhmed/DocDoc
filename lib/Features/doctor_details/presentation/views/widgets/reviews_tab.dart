
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/costant/doctor_review_items_list.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 32),
        child: Column(
          children: List.generate(doctorReviewList.length, (index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              titleAlignment: ListTileTitleAlignment.top,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorReviewList[index].name,
                    style:TextStyles.style16W600.copyWith(
                      color: AppColors.black2,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: List.generate(
                      doctorReviewList[index].rating,
                      (index) {
                        return const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.ratingStart,
                          size: 24,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
              subtitle: Text(
                doctorReviewList[index].description,
                style: TextStyles.style12W400.copyWith(
                  color: AppColors.textGrey,
                ),
              ),
              trailing: Text(
                doctorReviewList[index].time,
              ),
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(
                  doctorReviewList[index].image,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
