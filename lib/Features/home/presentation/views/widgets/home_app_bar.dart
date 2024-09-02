import 'package:doc_doc/Features/home/presentation/views/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theming/styles.dart';
import '../../../../../core/theming/colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Amr!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNotificationView(),));
    }
          ,child: CircleAvatar(
            radius: 24.0,
            backgroundColor: ColorsManager.moreLighterGray,
            child: SvgPicture.asset(
              'assets/svgs/notifications.svg',
            ),
          ),
        )
      ],
    );
  }
}
