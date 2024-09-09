import 'package:dio/dio.dart';
import 'package:doc_doc/Features/home/data/repo/home_repo_impl.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:doc_doc/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api_helper/end_points.dart';
import '../../../../core/cache/cache_helper.dart';
import '../Cubits/recommended_doctors_cubit/home_cubit.dart';
import '../Cubits/user_cubit/user_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HomeCubit(HomeRepoImpl())..getDoctors(token: token!)),
        BlocProvider(
          create: (context) => UserCubit(Dio())..fetchUser(),
        )
      ],
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
