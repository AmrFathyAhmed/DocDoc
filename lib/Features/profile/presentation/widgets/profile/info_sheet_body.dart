
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../data/models/profile_model/profile_model.dart';
import 'custom_container_item.dart';
import 'profile_list_tile.dart';
import 'package:flutter/material.dart';

class CustomInfoSheetBody extends StatelessWidget {
  const CustomInfoSheetBody({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
      
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
          
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 75),
      
            Text(
              "Amr Fathy",
              style: TextStyles.style18W600,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "3mrfat7y95@gmail.com",
              style: TextStyles.style14W400,
              textAlign: TextAlign.center,
            ),
      
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainerItem(
                  onTap: () {},
                  title: "My Appointment",
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(16),
                    topStart: Radius.circular(16),
                  ),
                ),
                const SizedBox(width: 1),
                CustomContainerItem(
                  onTap: () {
                    //context.push('/medicalRecordView');
                  },
                  title: "Medical records",
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(16),
                    topEnd: Radius.circular(16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ProfileListTile(
              onTap: () {
                // context.push(
                //   '/personalInformationView',
                //   extra: {
                //     'profile': profile,
                //   },
                // );
              },
              title: "Personal Information",
              image: Assets.svgsPersonalcard,
              backgroundColor: AppColors.scheduleChanged,
            ),
            const Divider(
              color: AppColors.textFieldBorder,
            ),
            ProfileListTile(
              onTap: () {},
              title: "My Test & Diagnostic",
              image: Assets.svgsMyTest,
              backgroundColor: AppColors.videoCallAppointment,
            ),
            const Divider(
              color: AppColors.textFieldBorder,
            ),
            ProfileListTile(
              onTap: () {
                //context.push('/paymentView');
              },
              title: "Payment",
              image: Assets.svgsNewPaymentAdded,
              backgroundColor: AppColors.appointmentCancelled,
              colorFilter: const ColorFilter.mode(
                AppColors.red2,
                BlendMode.srcIn,
              ),
            ),
          ]),
      ),
    );
  }
}
