import 'package:doc_doc/Features/auth/data/repo/login_repo_impl.dart';
import 'package:doc_doc/Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:doc_doc/Features/auth/presentation/manger/login_cubit/login_state.dart';
import 'package:doc_doc/Features/auth/presentation/views/widgets/terms_and_conditions_text.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/app_text_button.dart';
import 'package:doc_doc/core/widgets/app_text_form_field.dart';
import 'package:doc_doc/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          // Show loading indicator dialog
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(color:ColorsManager.mainBlue),
              );
            },
          );
        } else {
          // Close the loading dialog if any
          Navigator.pop(context);

          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const UserMainLayoutScreen(),
              ),
            );


            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Successful'),
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: AppColors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlackBold
                      .copyWith(color: ColorsManager.mainBlue),
                ),
                SizedBox(height: 18.h),
                SvgPicture.asset(
                  Assets.svgsDocdocLogo,
                  height: 150.h,
                ),
                SizedBox(height: 12.h),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular.copyWith(height: 1.6),
                ),
                SizedBox(height: 32.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: emailController,
                        hintText: "Email",
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !AppRegex.isEmailValid(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      AppTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid password';
                          } else if (value.length < 6) {
                            return 'Enter at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.h),
                      AppTextButton(
                        buttonText: "Login",
                        textStyle: TextStyles.font16WhiteMedium,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            BlocProvider.of<LoginCubit>(context).login(
                              email: email,
                              password: password,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 24.h),
                      const TermsAndConditionsText(),
                      SizedBox(height: 60.h),
                      const DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
