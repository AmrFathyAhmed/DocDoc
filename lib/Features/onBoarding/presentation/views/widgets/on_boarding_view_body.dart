import 'package:doc_doc/Features/onBoarding/presentation/views/widgets/app_logo_with_title.dart';
import 'package:doc_doc/Features/onBoarding/presentation/views/widgets/get_start_button.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_on_boarding_widget.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 32.h,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppLogoWithTitleWidget(),
            const DoctorOnBoardingWidget(),
            Text(
              "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
              style: TextStyles.font12GrayMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32.h,
            ),
            GetStartedButton(),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    ));
  }
}
