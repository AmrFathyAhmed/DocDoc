import 'package:flutter/material.dart';

import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return DoctorsListViewItem(

        );
      },
    );
  }
}
