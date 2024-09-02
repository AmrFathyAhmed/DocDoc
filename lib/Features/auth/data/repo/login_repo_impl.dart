import 'dart:ffi';

import 'package:dio/dio.dart';

class AuthRepoImpl{
 Future<void> login(String email ,String password)async{
     try {
       await Dio().post("https://vcare.integration25.com/api/auth/auth",data:{
        "email":email,
        "password":password
           } );
     } on Exception catch (e) {
      print(e);
     }

}

}