import 'package:doc_doc/Features/home/presentation/views/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theming/styles.dart';
import '../../../../../core/theming/colors.dart';
import '../../Cubits/user_cubit/user_cubit.dart';
import '../../Cubits/user_cubit/user_state.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return Text(
                    'Loading...',
                    style: TextStyles.font18DarkBlueBold,
                  );
                } else if (state is UserSuccess) {
                return Text(
                  'Hi, ${state.user.first.name}!',
                  style: TextStyles.font18DarkBlueBold,
                );}
                return Text(
                  'Hi!',
                  style: TextStyles.font18DarkBlueBold,
                );
                },

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
