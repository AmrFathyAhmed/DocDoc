import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://th.bing.com/th/id/OIP.T0nPc_C2Z0gtaD6sI1ryRQHaHp?rs=1&pid=ImgDetMain",
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: ColorsManager.lightGray,
                highlightColor: Colors.white,
                child: Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              width: 110.w,
              height: 120.h,
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
                   'Dr. Randy Wigham',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text(
                  'General | RSUD Gatot Subroto',
                  style: TextStyles.font12GrayMedium,
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(Icons.star_rounded,size: 18.h,color: Colors.yellow,),
                    Text("4.8 (4,279 reviews)",style: TextStyles.font12GrayMedium,)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
