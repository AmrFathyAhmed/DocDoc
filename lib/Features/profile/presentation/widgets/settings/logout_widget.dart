
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../generated/assets.dart';
import 'logout_dialog.dart';
import 'settings_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListTile(
      onTap: () {
       // var profileCubit = context.read<ProfileCubit>();
        showCupertinoDialog(
          context: context,
          barrierDismissible: true, builder: (BuildContext context) { return LogOutDialog(token: token!,); },

        );
      },
      title: 'Logout',
      image: Assets.svgsSettingsLogout,
      textColor: AppColors.red2,
    );
  }
}
