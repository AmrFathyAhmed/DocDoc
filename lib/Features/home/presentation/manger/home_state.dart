import '../../data/models/doctor_model.dart';

class HomeState {}
class HomeInit extends HomeState{}
class HomeSuccess extends HomeState{
  final List<Doctor> doctors;
  HomeSuccess({required this.doctors});
}
class HomeLoading extends HomeState{}
class HomeFailure extends HomeState{
  final String errorMessage;

  HomeFailure({required this.errorMessage});
}