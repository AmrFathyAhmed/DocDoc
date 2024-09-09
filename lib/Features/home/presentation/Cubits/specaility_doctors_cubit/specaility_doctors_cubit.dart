import 'package:doc_doc/Features/home/presentation/Cubits/specaility_doctors_cubit/specaility_doctors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/doctor_model.dart';
import '../../../data/repo/home_repo_impl.dart';

class SpecialityDoctorCubit extends Cubit<SpecialityDoctorState> {
  final HomeRepoImpl _SpecialityDoctorRepo;

  SpecialityDoctorCubit(this._SpecialityDoctorRepo) : super(SpecialityDoctorInit());

  Future<void> getSpecialityDoctors({required String token,required int id}) async {
    try {
      emit(SpecialityDoctorLoading());
      List<Doctor> doctors = await _SpecialityDoctorRepo.getSpecialityDoctors(token: token,id:id.toString());
      emit(SpecialityDoctorSuccess(doctors: doctors));
    } on Exception catch (e) {
      emit(SpecialityDoctorFailure(errorMessage: e.toString()));
    }
  }
}
