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
  Future<List<Doctor>> getSpecialityDoctors({required String token, required String id}) async {
    try {
      var response = await Dio().get(
        EndPoints.baseUrl + EndPoints.specialization + id,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Add the token to the request headers
          },
        ),
      );

      if (response.data != null && response.data['data'] != null) {
        var data = response.data['data'];


        if (data is List) {
          // 'data' is a List, map it to Doctor objects
          List<Doctor> doctors = data.map((doctorJson) => Doctor.fromJson(doctorJson)).toList();
          return doctors;
        } else if (data is Map) {
          if (data['doctors'] != null && data['doctors'] is List) {
            List<Doctor> doctors = (data['doctors'] as List)
                .map((doctorJson) => Doctor.fromJson(doctorJson))
                .toList();
            return doctors;
          } else {
            throw Exception('No doctors found in the response');
          }
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
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
