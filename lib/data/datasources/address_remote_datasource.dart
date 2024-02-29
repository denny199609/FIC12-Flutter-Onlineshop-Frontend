import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_apps/core/constants/variables.dart';
import 'package:flutter_onlineshop_apps/data/datasources/auth_local_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/requests/address_request_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/address_response_model.dart';
import 'package:http/http.dart' as http;

class AddressRemoteDataSource {
  Future<Either<String, AddressResponseModel>> getAddresses() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/addresses'), headers: {
      'Authorization': 'Bearer ${authData?.token}',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      return Right(AddressResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }

  Future<Either<String, String>> addAddress(AddressRequestModel data) async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final response = await http.post(
          Uri.parse('${Variables.baseUrl}/api/addresses'),
          body: data.toJson(),
          headers: {
            'Authorization': 'Bearer ${authData?.token}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 201) {
        return const Right('success');
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return const Left('Error');
    }
  }
}
