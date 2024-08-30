import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogoWithTitleWidget extends StatelessWidget
{
  const AppLogoWithTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(

        padding:  EdgeInsets.only(top: 21.h,bottom: 41.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.svgsDocdocLogo,),
          SizedBox(width: 3.w,),
          Text("Docdoc",style: TextStyles.font24BlackBold.copyWith(), )
        ],
            ),
      );
  }
}
