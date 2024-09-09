
import '../../../home/data/models/doctor_model.dart';

class SearchState {}

final class SearchInit extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
final List<Doctor> doctors;

SearchSuccess({required this.doctors});
}

final class SearchFailure extends SearchState {
final String errorMessage;

SearchFailure({required this.errorMessage});
}
