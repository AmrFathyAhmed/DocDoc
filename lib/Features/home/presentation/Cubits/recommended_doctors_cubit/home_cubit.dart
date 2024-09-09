import 'package:doc_doc/Features/home/data/repo/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/doctor_model.dart';
import 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInit());

  Future<void> getDoctors({required String token}) async {
    try {
      emit(HomeLoading());
      List<Doctor> doctors = await _homeRepo.getDoctors(token: token);
      emit(HomeSuccess(doctors: doctors));
    } on Exception catch (e) {
      emit(HomeFailure(errorMessage: e.toString()));
    }
  }
}
