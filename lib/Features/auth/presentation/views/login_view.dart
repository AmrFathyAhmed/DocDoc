import 'package:doc_doc/Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:doc_doc/Features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
