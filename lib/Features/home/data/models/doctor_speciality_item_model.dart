import 'doctor_model.dart';

class DoctorSpecialityItemModel {
  final String image;
  final String name;
  final int id;

  DoctorSpecialityItemModel(  {required this.id,required this.image,required this.name,});
}
class SpecializationWithDoctors {
  final int id;
  final String name;
  final List<Doctor> doctors;

  SpecializationWithDoctors({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory SpecializationWithDoctors.fromJson(Map<String, dynamic> json) {
    var doctorsList = json['doctors'] as List;
    List<Doctor> doctors = doctorsList.map((i) => Doctor.fromJson(i)).toList();

    return SpecializationWithDoctors(
      id: json['id'],
      name: json['name'],
      doctors: doctors,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'doctors': doctors.map((doctor) => doctor.toJson()).toList(),
    };
  }
}
