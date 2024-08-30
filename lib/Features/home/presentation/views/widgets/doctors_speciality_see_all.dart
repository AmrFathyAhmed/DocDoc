import 'package:flutter/material.dart';

import '../../../../../core/theming/styles.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        Text(
          'See All',
          style: TextStyles.font12BlueRegular,
        ),
      ],
    );
  }
}
