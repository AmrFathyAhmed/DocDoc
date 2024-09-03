import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doc_doc/Features/auth/presentation/manger/login_cubit/login_state.dart';
import 'package:doc_doc/core/api_helper/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache/cache_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoading());

      // Make the network request
      final response = await Dio().post(
        EndPoints.baseUrl + EndPoints.login,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );

      var responseData = response.data;

      // Ensure responseData is a Map and not already decoded JSON
      if (responseData is Map<String, dynamic>) {
        if (response.statusCode == 200 && responseData[ApiKeys.status] == true) {

          await CacheHelper().saveData(
            key: ApiKeys.token,
            value: responseData[ApiKeys.data][ApiKeys.token],
          );
         // token = responseData[ApiKeys.data][ApiKeys.token];
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(
            errorMessage: responseData[ApiKeys.message].toString(),
          ));
        }
      } else {
        // Handle unexpected response format
        emit(LoginFailure(errorMessage: 'Unexpected response format.'));
      }
    } on DioException catch (e) {
      // Handling Dio-specific exceptions
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        emit(LoginFailure(
          errorMessage: e.response!.data[ApiKeys.message]?.toString() ?? 'An error occurred',
        ));
      } else {
        emit(LoginFailure(
          errorMessage: 'An error occurred during the network request.',
        ));
      }
    } catch (e) {
      // Handling any other type of exception
      emit(LoginFailure(
        errorMessage: 'An unexpected error occurred: $e',
      ));
    }
  }
}
