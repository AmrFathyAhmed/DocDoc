import 'package:dio/dio.dart';
import 'package:doc_doc/core/api_helper/end_points.dart';

import '../models/doctor_model.dart';

class HomeRepoImpl {

  Future<List<Doctor>> getDoctors({required String token}) async {
    try {
      var response = await Dio().get(
        EndPoints.baseUrl + EndPoints.allDoctor,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Add the token to the request headers
          },
        ),
      );
      if (response.data != null && response.data['data'] != null) {
        List<Doctor> doctors = (response.data['data'] as List)
            .map((doctorJson) => Doctor.fromJson(doctorJson))
            .toList();

        return doctors;

    }else {
    throw Exception('Failed to load doctors');
    }
    } on DioException catch (e) {
      print('DioError: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
