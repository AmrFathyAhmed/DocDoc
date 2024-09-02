import 'package:doc_doc/Features/home/presentation/views/notification_view.dart';

import '../../../../generated/assets.dart';
import '../../../home/presentation/views/widgets/notifaction_app_bar.dart';
import '../widgets/settings/logout_widget.dart';
import '../widgets/settings/settings_list_tile.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Settings"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(24.0),
          child: Column(
            children: [
              SettingsListTile(
                onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNotificationView(),));
                },
                title: 'Notification',
                image: Assets.svgsSettingsNotification,
              ),
              SettingsListTile(
                onTap: () {
                },
                title: 'FAQ',
                image: Assets.svgsSettingsFaq,
              ),
              SettingsListTile(
                onTap: () {
                },
                title: 'Security',
                image: Assets.svgsSettingsLock,
              ),
              SettingsListTile(
                onTap: () {
                 // context.push("/languageView");
                },
                title: 'Language',
                image: Assets.svgsSettingsLanguage,
              ),
              const LogOutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
