import 'package:doc_doc/Features/search/presentation/views/widgets/search_item.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../generated/assets.dart';
import '../../../search/presentation/manger/search_cubit.dart';
import '../../../search/presentation/manger/search_state.dart';
import '../../../home/presentation/views/widgets/notifaction_app_bar.dart';
import '../../../home/presentation/views/widgets/search_and_filter_bar.dart';
import '../../data/repo/home_repo_impl.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl()),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: buildAppBar(context, title: "Recommendation Doctors"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 32.h),
                    SearchAndFilterBar(
                      onTap: () {
                        openModalSheet(context);
                      },
                      onChanged: (query) {
                        // Make sure to use the correct context here
                        BlocProvider.of<SearchCubit>(context).getDoctors(
                            token: token!,
                            name: query
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    if (state is SearchLoading)
                    const   SizedBox(height:500,child: Center(child: CircularProgressIndicator(color: ColorsManager.mainBlue,)))
                    else if (state is SearchSuccess)

                        state.doctors.isNotEmpty
                            ? DoctorsListView2(doctors: state.doctors)
                            : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 80,),
                                SizedBox(height:300,child: SvgPicture.asset(Assets.svgsPersonalfilesBro)),
                                Center(child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text("No doctors found matching your search criteria.",style: TextStyle(fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                                )),
                              ],
                            )

                    else if (state is SearchFailure)
                        Center(child: Text(state.errorMessage)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
