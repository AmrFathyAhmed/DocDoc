import 'package:dio/dio.dart';
import 'package:doc_doc/core/api_helper/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/cache_helper.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final Dio _dio;

  LogoutCubit(this._dio) : super(LogoutInitial());

  Future<void> logout(String token) async {
    emit(LogoutLoading());

    try {
      // Make API call to the logout endpoint
      Response response = await _dio.post(
        EndPoints.baseUrl+EndPoints.logout,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Send token in the header
          },
        ),
      );
      await CacheHelper().removeData(
        key: ApiKeys.token,
      );
      if (response.statusCode == 200) {
        // Successful logout
        emit(LogoutSuccess());
      } else {
        // Handle failure response
        emit(LogoutFailure(response.data['message'] ?? 'Logout failed'));
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      String errorMessage = e.response?.data['message'] ?? 'Logout failed';
      emit(LogoutFailure(errorMessage));
    } catch (e) {
      // Handle any other errors
      emit(LogoutFailure('An unexpected error occurred: $e'));
    }
  }
}