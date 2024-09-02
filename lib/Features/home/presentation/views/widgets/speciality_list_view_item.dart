import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/costant/specialityList.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class SpecialityListViewItem extends StatelessWidget {
  // final SpecializationsData? specializationsData;
   final int itemIndex;
  // final int selectedIndex;
  const SpecialityListViewItem({
    super.key, required this.itemIndex,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [

          CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorsManager.lightBlue,
                  child: Image.asset(
                    specialitylList.elementAt(itemIndex).image,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
          SizedBox(height: 8.h,),
          Text(
            specialitylList.elementAt(itemIndex).name,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
