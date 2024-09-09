import 'package:bloc/bloc.dart';
import 'package:doc_doc/core/api_helper/end_points.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../data/models/user_model.dart';
import 'user_state.dart';
import 'package:dio/dio.dart'; // For API requests

class UserCubit extends Cubit<UserState> {
  final Dio dio;

  UserCubit(this.dio) : super(UserInit());

  // Fetch user data from API
  Future<void> fetchUser() async {
    emit(UserLoading());
    try {
      final response = await Dio().get(
        EndPoints.baseUrl + EndPoints.profile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Add the token to the request headers
          },
        ),
      );
      if (response.statusCode == 200 && response.data['status'] == true) {
        List<User> user = (response.data['data'] as List)
            .map((json) => User.fromJson(json))
            .toList();
        emit(UserSuccess(user: user));
      } else {
        emit(UserFailure(errorMessage: "Failed to fetch users"));
      }
    } catch (e) {
      emit(UserFailure( errorMessage: e.toString(),));
    }
  }
}
