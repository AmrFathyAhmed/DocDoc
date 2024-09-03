import 'package:flutter/material.dart';

import '../../../../../core/theming/styles.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key, required this.title, required this.onTap});
final String title;
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            'See All',
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ],
    );
  }
}
