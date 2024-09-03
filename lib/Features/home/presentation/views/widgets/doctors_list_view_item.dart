import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_doc/Features/doctor_details/presentation/views/doctor_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/costant/doctor_images.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/doctor_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, required this.doctor, required this.images,});
  final Doctor doctor;
  final String images;

  @override
  Widget build(BuildContext context) {
    final random = Random();

    double randomRating = 3.0 + random.nextDouble() * 2.0;
    int randomReviewCount = 1000 + random.nextInt(4000);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetailsView(),));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl:
                 // "https://th.bing.com/th/id/OIP.T0nPc_C2Z0gtaD6sI1ryRQHaHp?rs=1&pid=ImgDetMain"
                images??doctor.photo,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 72.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                );
              },
              imageBuilder: (context, imageProvider) => Container(
                width: 72.w,
                height: 72.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     //'Dr. Randy Wigham',
                    doctor.name,
                    style: TextStyles.font18DarkBlueBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${doctor.specialization.name} | ${doctor.degree}',
                    style: TextStyles.font12GrayMedium,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(Icons.star_rounded,size: 18.h,color: Colors.yellow,),
                      Text("${randomRating.toStringAsFixed(2)} ($randomReviewCount reviews)",style: TextStyles.font12GrayMedium,)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
