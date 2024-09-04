
import 'package:dio/dio.dart';
import 'package:doc_doc/core/api_helper/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/helpers/constants.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInit());

  Future<void> Book({required int doctorId, required String startDate,required String note,}) async {
    try {
      emit(BookLoading());

      // Make the network request
      final response = await Dio().post(
        EndPoints.baseUrl + EndPoints.makeAppointment,
        data: {
          ApiKeys.doctorId: doctorId,
          ApiKeys.startTime: startDate,
          ApiKeys.notes: note,
        }, options: Options(
        headers: {
          'Authorization': 'Bearer $token', // Add the token to the request headers
        },
      ),
      );

      var responseData = response.data;
      print(responseData);
      // Ensure responseData is a Map and not already decoded JSON
      if (responseData is Map<String, dynamic>) {
        if (response.statusCode! <=203 && responseData[ApiKeys.status] == true) {

          emit(BookSuccess());
        } else {
          emit(BookFailure(
            errorMessage: responseData[ApiKeys.message].toString(),
          ));
        }
      } else {
        // Handle unexpected response format
        emit(BookFailure(errorMessage: 'Unexpected response format.'));
      }
    } on DioException catch (e) {
      // Handling Dio-specific exceptions
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        emit(BookFailure(
          errorMessage: e.response!.data[ApiKeys.message]?.toString() ?? 'An error occurred',
        ));
      } else {
        emit(BookFailure(
          errorMessage: 'An error occurred during the network request.',
        ));
      }
    } catch (e) {
      // Handling any other type of exception
      emit(BookFailure(
        errorMessage: 'An unexpected error occurred: $e',
      ));
    }
  }
}
