import '../../../data/models/doctor_model.dart';

class SpecialityDoctorState {}
class SpecialityDoctorInit extends SpecialityDoctorState{}
class SpecialityDoctorSuccess extends SpecialityDoctorState{
  final List<Doctor> doctors;
  SpecialityDoctorSuccess({required this.doctors});
}
class SpecialityDoctorLoading extends SpecialityDoctorState{}
class SpecialityDoctorFailure extends SpecialityDoctorState{
  final String errorMessage;

  SpecialityDoctorFailure({required this.errorMessage});
}