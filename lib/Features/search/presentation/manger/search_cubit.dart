import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/doctor_model.dart';
import '../../data/repo/home_repo_impl.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepoImpl _searchRepo;

  SearchCubit(this._searchRepo) : super(SearchInit());

  Future<void> getDoctors({required String token, required String name}) async {
    try {
      emit(SearchLoading());
      List<Doctor> doctors = await _searchRepo.getDoctors(token: token, name: name);
      emit(SearchSuccess(doctors: doctors));
    } on Exception catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
