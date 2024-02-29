import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_apps/core/constants/variables.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/products_category_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/responses/product_response_model.dart';

class ProductRemoteDataSource {
  Future<Either<String, ProductResponseModel>> getProducts() async {
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/products'),
    );

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error'); 
    }
  }

  Future<Either<String, ProductResponseModel>> getProductsByCategory(String id) async {
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/products?category_id=$id'),
    );

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error'); 
    }
  }

  Future<Either<String, ProductResponseModel>> getProductsByName(String name) async {
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/products/name?name=$name'),
    );

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error'); 
    }
  }
}
