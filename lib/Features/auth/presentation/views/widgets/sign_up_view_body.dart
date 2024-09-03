import 'package:doc_doc/Features/auth/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:doc_doc/Features/auth/presentation/manger/sign_up_cubit/sign_up_state.dart';
import 'package:doc_doc/Features/auth/presentation/views/login_view.dart';
import 'package:doc_doc/Features/auth/presentation/views/widgets/terms_and_conditions_text.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/app_text_button.dart';
import 'package:doc_doc/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_regex.dart';
import 'already_have_acount.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}
bool isObscureText = true;
class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
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
          Navigator.pop(context);

          if (state is SignUpSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('SignUp Successful'),
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is SignUpFailure) {
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
                    key: formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            controller:  nameController,
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
                            controller: emailController,
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
                            controller: phoneController,
                              hintText: "Phone",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a phone number';
                                } else if (!RegExp(r'^\+?[0-9]{10,13}$').hasMatch(value)) {
                                  return 'Please enter a valid phone number';
                                }
                                return null;
                              }),
      
                          SizedBox(
                            height: 16.h,
                          ),
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
                                isObscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty||value.length<6) {
                                return 'Please enter a valid password';
                              }
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          AppTextFormField(
                            controller: confirmPasswordController,
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
                              }else if (passwordController.text!=value) {
                                return 'Passwords do not match';
                              }

                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          AppTextButton(
                              buttonText: "Create Account",
                              textStyle: TextStyles.font16WhiteMedium,
                              onPressed: () {
                               if(formKey.currentState!.validate()){
                                 BlocProvider.of<SignUpCubit>(context).signUp(name: nameController.text, password: passwordController.text, email: emailController.text, phone: phoneController.text);

                               } }),
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
          )),
    );
  }
}
