import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_apps/core/constants/variables.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/cost_response_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/province_response_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/subdistrict_response_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/tracking_response_model.dart';
import 'package:http/http.dart' as http;

class RajaongkirRemoteDataSource {
  //get province using url https://api.rajaongkir.com/starter/province
  Future<Either<String, ProvinceResponseModel>> getProvince() async {
    const url = 'https://pro.rajaongkir.com/api/province';
    final response = await http.get(Uri.parse(url), headers: {
      'key': Variables.rajaOngkirKey,
    });

    if (response.statusCode == 200) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  Future<Either<String, CityResponseModel>> getCityByProvince(
      String provID) async {
    final url = 'https://pro.rajaongkir.com/api/city?province=$provID';
    final response = await http.get(Uri.parse(url), headers: {
      'key': Variables.rajaOngkirKey,
    });

    if (response.statusCode == 200) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  Future<Either<String, SubdistrictResponseModel>> getSubdistrictByCity(
      String cityID) async {
    final url = 'https://pro.rajaongkir.com/api/subdistrict?city=$cityID';
    final response = await http.get(Uri.parse(url), headers: {
      'key': Variables.rajaOngkirKey,
    });

    if (response.statusCode == 200) {
      return Right(SubdistrictResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  //cost
  Future<Either<String, CostResponseModel>> getCost(
      String origin, String destination, String courier) async {
    const url = 'https://pro.rajaongkir.com/api/cost';
    final response = await http.post(Uri.parse(url), headers: {
      'key': Variables.rajaOngkirKey,
    }, body: {
      'origin': origin,
      'originType': 'subdistrict',
      'destination': destination,
      'destinationType': 'subdistrict',
      'weight': '1000',
      'courier': courier
    });
    if (response.statusCode == 200) {
      return Right(CostResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  //tracking waybill
  Future<Either<String, TrackingResponseModel>> getTracking(
      String waybill, String courier) async {
    const url = 'https://pro.rajaongkir.com/api/waybill';
    final response = await http.post(Uri.parse(url), headers: {
      'key': Variables.rajaOngkirKey,
    }, body: {
      'waybill': waybill,
      'courier': courier,
    });

    if (response.statusCode == 200) {
      return Right(TrackingResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }
}
