import 'package:doc_doc/Features/auth/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:doc_doc/Features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child:const  Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
