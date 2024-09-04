import '../../data/models/my_appointment_model/my_appointment_model.dart';

class MyAppointmentState {}

final class MyAppointmentInitial extends MyAppointmentState {}

final class GetMyAppointmentLoading extends MyAppointmentState {}

final class GetMyAppointmentSuccess extends MyAppointmentState {
  final List<Appointment> appointment;

  GetMyAppointmentSuccess({required this.appointment});
}

final class GetMyAppointmentFailure extends MyAppointmentState {
  final String errMessage;

  GetMyAppointmentFailure({required this.errMessage});
}
