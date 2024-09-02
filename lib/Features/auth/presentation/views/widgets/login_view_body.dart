import 'package:doc_doc/Features/auth/presentation/views/widgets/terms_and_conditions_text.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/app_text_button.dart';
import 'package:doc_doc/core/widgets/app_text_form_field.dart';
import 'package:doc_doc/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../home/presentation/views/nav_bar_widget.dart';
import 'dont_have_account_text.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}
bool isObscureText = true;
class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Welcome Back",
              style: TextStyles.font24BlackBold
                  .copyWith(color: ColorsManager.mainBlue),
            ),
            SizedBox(
              height: 18.h,
            ),
            SvgPicture.asset(
              Assets.svgsDocdocLogo,
              height: 150.h,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GrayRegular.copyWith(height: 1.6)),
            SizedBox(
              height: 32.h,
            ),
            Form(
                child: Column(
              children: [
                AppTextFormField(
                    hintText: "Email",
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return 'Please enter a valid email';
                      }
                    }),
                SizedBox(
                  height: 16.h,
                ),
                AppTextFormField(
                  hintText: "Password",
                  isObscureText: isObscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                AppTextButton(
                    buttonText: "Login",
                    textStyle: TextStyles.font16WhiteMedium,
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const UserMainLayoutScreen(),));}),
                SizedBox(
                  height: 24.h,
                ),
                const TermsAndConditionsText(),
                SizedBox(
                  height: 60.h,
                ),
                const DontHaveAccountText(),
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
