import 'package:doc_doc/Features/my_appointment/presentation/cubit/my_appointment_cubit.dart';
import 'package:doc_doc/Features/my_appointment/presentation/views/widgets/my_appointment_view_body.dart';
import 'package:doc_doc/Features/my_appointment/presentation/views/widgets/search_trailing_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/views/widgets/notifaction_app_bar.dart';

import 'package:flutter/material.dart';

class MyAppointmentView extends StatelessWidget {
  const MyAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAppointmentCubit()..fetchMyAppointment(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: "My Appointments",
          trailing: const SearchTrailingAppBar(),
        ),
        body: const MyAppointmentViewBody(),
      ),
    );
  }
}
