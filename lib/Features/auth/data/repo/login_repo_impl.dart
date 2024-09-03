
import 'package:dio/dio.dart';

class AuthRepoImpl{
 login({required String email ,required String password})async{
     try {
      var respond = await Dio().post("https://vcare.integration25.com/api/auth/login",data:{
        "email": email,
        "password": password
           } );
      return respond;
     } on Exception catch (e) {
      print(e);
     }

}

}