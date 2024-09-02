

import '../../../../core/theming/colors.dart';
import '../../../../generated/assets.dart';
import '../../../home/presentation/views/widgets/notifaction_app_bar.dart';
import '../widgets/settings/payment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Payment",
        trailing: Container(
          constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
          margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5, end: 16),
          padding: const EdgeInsetsDirectional.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: AppColors.white,
            border: Border.all(
              color: AppColors.textFieldBorder,
            ),
          ),
          child: SvgPicture.asset(
            Assets.svgsScanner,
            colorFilter: const ColorFilter.mode(
              AppColors.black2,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      body: const PaymentViewBody(),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

      ),
    );
  }
}
