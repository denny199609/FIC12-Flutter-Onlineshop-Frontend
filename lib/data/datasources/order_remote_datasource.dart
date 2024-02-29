import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_apps/core/constants/variables.dart';
import 'package:flutter_onlineshop_apps/data/datasources/auth_local_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/requests/order_request_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/order_detail_response_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/order_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/responses/history_order_response_model.dart';

class OrderRemoteDataSource {
  Future<Either<String, OrderResponseModel>> createOrder(
      OrderRequestModel orderRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/order'),
        body: orderRequestModel.toJson(),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authData?.token}',
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 201) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }

  Future<Either<String, String>> getStatusOrder(String id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/order/status/$id'), headers: {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': 'Bearer ${authData?.token}',
    });

    if (response.statusCode == 200) {
      return Right(jsonDecode(response.body)['status']);
    } else {
      return const Left('Internal Server Error');
    }
  }

  //get orders by userid
  Future<Either<String, HistoryOrderResponseModel>> getOrders() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/orders'), headers: {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': 'Bearer ${authData?.token}',
    });

    if (response.statusCode == 200) {
      return Right(HistoryOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }

  
  Future<Either<String, OrderDetailResponseModel>> getOrderById(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/order/$id'), headers: {
      'Accept': 'application/json',
      // 'content-type': 'application/json',
      'Authorization': 'Bearer ${authData?.token}',
    });

    if (response.statusCode == 200) {
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }
}
