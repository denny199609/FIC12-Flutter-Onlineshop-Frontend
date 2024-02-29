import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_apps/core/constants/variables.dart';
import 'package:flutter_onlineshop_apps/data/datasources/auth_local_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/login'),
        body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body.toString());
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/logout'),
        headers: {'Authorization': 'Bearer ${authData?.token}'});

    if (response.statusCode == 200) {
      await AuthLocalDataSource().removeAuthData();
      return Right(response.body.toString());
    } else {
      return Left(response.body.toString());
    }
  }

  //update fcm token
  Future<Either<String, String>> updateFCMToken(String fcmToken) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http
        .post(Uri.parse('${Variables.baseUrl}/api/update-fcm-id'), headers: {
      'Authorization': 'Bearer ${authData?.token}',
      'Accept': 'application/json',
    }, body: {
      'fcm_id': fcmToken
    });

    if (response.statusCode == 200) {
      return Right(response.body.toString());
    } else {
      return Left(response.body.toString());
    }
  }
}
