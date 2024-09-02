import 'package:doc_doc/Features/home/presentation/views/widgets/custom_notification_header.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/notifaction_app_bar.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/notifaction_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';



class HomeNotificationView extends StatelessWidget {
  const HomeNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Notification',
        trailing: const Padding(
          padding: EdgeInsetsDirectional.only(top: 16,end: 16),
          child: TextButton(
            onPressed: null,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.primary),
              elevation: WidgetStatePropertyAll(0),
            ),
            child: Text(
              '2 NEW',
              style: TextStyles.style10W500,
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomNotificationsHeader(),
            SizedBox(height: 16),
            NotificationViewBody(),
          ],
        ),
      ),
    );
  }
}
