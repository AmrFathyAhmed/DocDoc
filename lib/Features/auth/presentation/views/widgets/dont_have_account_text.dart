import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/styles.dart';
import '../sign_up_view.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView(),));
              },

          ),

        ],
      ),
    );
  }
}