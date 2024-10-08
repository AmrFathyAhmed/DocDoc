import '../../../../../core/helpers/notification_item_list.dart';
import 'notification_item.dart';
import 'package:flutter/material.dart';

class CustomNotificationItemsList extends StatelessWidget {
  const CustomNotificationItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        notificationItemModelList.length,
        (index) {
          var notificationItem = notificationItemModelList[index];
          return NotificationItem(
            notificationItemModelList: notificationItem,
          );
        },
      ),
    );
  }
}
