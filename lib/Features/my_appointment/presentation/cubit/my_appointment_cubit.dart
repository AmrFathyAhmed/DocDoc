import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api_helper/end_points.dart';
import '../../../../core/helpers/constants.dart';
import '../../data/models/my_appointment_model/my_appointment_model.dart';
import 'my_appointment_state.dart';

class MyAppointmentCubit extends Cubit<MyAppointmentState> {
  MyAppointmentCubit() : super(MyAppointmentInitial());

  void fetchMyAppointment() async {
    try {
      emit(GetMyAppointmentLoading());

      var response = await Dio().get(
        EndPoints.baseUrl + EndPoints.myAppointment,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Add the token to the request headers
          },
        ),
      );

      // Check if response.data is a String and decode it if necessary
      var responseData = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (response.statusCode == 200 && responseData[ApiKeys.status] == true) {
        // Parse the appointment data
        List<Appointment> appointments = (responseData[ApiKeys.data] as List)
            .map((appointmentJson) => Appointment.fromJson(appointmentJson))
            .toList();

        emit(GetMyAppointmentSuccess(appointment: appointments));
      } else {
        emit(GetMyAppointmentFailure(errMessage: responseData[ApiKeys.message]));
      }
    } catch (e) {
      print(e.toString());
      emit(GetMyAppointmentFailure(errMessage: e.toString()));
    }
  }

}
