import 'package:dio/dio.dart';
import 'package:doc_doc/Features/auth/presentation/manger/sign_up_cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api_helper/end_points.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInit());

  Future<void> signUp({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      emit(SignUpLoading());

      final response = await Dio().post(
        EndPoints.baseUrl + EndPoints.register,
        data: {
          ApiKeys.email: email,
          ApiKeys.name: name,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: password,
          ApiKeys.phone: phone,
          ApiKeys.gender: '0',
        },
      );
      var responseData = response.data;
      if (response.statusCode == 200 || responseData[ApiKeys.status] == true) {
        //* Success
        emit(SignUpSuccess());
        print(responseData);
      } else {

        _handleSignUpErrors(responseData);
        print(responseData);
      }
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
      print(e);
    }
  }

  //! Handle Register errors in the response
  void _handleSignUpErrors(responseData) {
    if (responseData[ApiKeys.data] != null) {
      var errorMessage = responseData[ApiKeys.data];
      if (errorMessage is Map<String, dynamic>) {
        List<String> errorMessages = [];
        if (errorMessage.containsKey(ApiKeys.name)) {
          errorMessages.add(errorMessage[ApiKeys.name][0]);
        }
        if (errorMessage.containsKey(ApiKeys.email)) {
          errorMessages.add(errorMessage[ApiKeys.email][0]);
        }
        if (errorMessage.containsKey(ApiKeys.password)) {
          errorMessages.add(errorMessage[ApiKeys.password][0]);
        }
        if (errorMessage.containsKey(ApiKeys.gender)) {
          errorMessages.add(errorMessage[ApiKeys.gender][0]);
        }
        if (errorMessage.containsKey(ApiKeys.confirmPassword)) {
          errorMessages.add(errorMessage[ApiKeys.confirmPassword][0]);
        }
        if (errorMessage.containsKey(ApiKeys.phone)) {
          errorMessages.add(errorMessage[ApiKeys.phone][0]);
        }
        emit(SignUpFailure(errorMessage: errorMessages.join(', ')));
      } else {
        emit(SignUpFailure(errorMessage: errorMessage.toString()));
      }
    } else {
      emit(SignUpFailure(errorMessage: 'Unknown error occurred.'));
    }

    }}

