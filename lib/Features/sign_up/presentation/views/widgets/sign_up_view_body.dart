import 'package:doc_doc/Features/login/presentation/views/widgets/terms_and_conditions_text.dart';
import 'package:doc_doc/Features/sign_up/presentation/views/widgets/already_have_acount.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/app_text_button.dart';
import 'package:doc_doc/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../login/presentation/views/widgets/dont_have_account_text.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}
bool isObscureText = true;
class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Create Account",
                  style: TextStyles.font24BlackBold
                      .copyWith(color: ColorsManager.mainBlue),
                ),
                // SizedBox(
                //   height: 18.h,
                // ),
                // SvgPicture.asset(
                //   Assets.svgsDocdocLogo,
                //   height: 150.h,
                // ),
                 SizedBox(
                  height: 12.h,
                ),
                Text(
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                    style: TextStyles.font14GrayRegular.copyWith(height: 1.6)),
                SizedBox(
                  height: 32.h,
                ),
                Form(
                    child: Column(
                      children: [
                        AppTextFormField(
                            hintText: "Name",
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ) {
                                return 'Please enter a valid email';
                              }
                            }),
                        SizedBox(
                          height: 16.h,
                        ),
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
                            hintText: "Phone",
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||value.length>=11 ) {
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
                          height: 16.h,
                        ),
                        AppTextFormField(
                          hintText: "Confirm Password",
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
                            buttonText: "Create Account",
                            textStyle: TextStyles.font16WhiteMedium,
                            onPressed: () {}),
                        SizedBox(
                          height: 24.h,
                        ),
                        const TermsAndConditionsText(),
                        SizedBox(
                          height: 60.h,
                        ),
                        const AlreadyHaveAcount(),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
