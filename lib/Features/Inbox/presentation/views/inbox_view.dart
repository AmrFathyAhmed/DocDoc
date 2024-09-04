import 'package:doc_doc/Features/Inbox/presentation/views/widgets/create_new_message_btn.dart';
import 'package:doc_doc/Features/Inbox/presentation/views/widgets/messages_view_body.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/views/widgets/notifaction_app_bar.dart';


class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Messages',
        trailing: const CreateNewMessageBtn(),
      ),
      body: const MessagesViewBody(),
    );
  }
}
