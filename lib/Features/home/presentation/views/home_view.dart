import 'package:doc_doc/Features/home/data/repo/home_repo_impl.dart';
import 'package:doc_doc/Features/home/presentation/manger/home_cubit.dart';
import 'package:doc_doc/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:doc_doc/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api_helper/end_points.dart';
import '../../../../core/cache/cache_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token;
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl())..getDoctors(token: token!) ,
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
