import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/styles.dart';
import '../login_view.dart';

class AlreadyHaveAcount extends StatelessWidget {
  const AlreadyHaveAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: 'Already have an account yet?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView(),));
              },

          ),

        ],
      ),
    );
  }
}