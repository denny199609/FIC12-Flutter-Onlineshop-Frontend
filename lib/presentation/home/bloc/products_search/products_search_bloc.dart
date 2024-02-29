// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/datasources/order_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/datasources/product_remote_datasource.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'products_search_bloc.freezed.dart';
part 'products_search_event.dart';
part 'products_search_state.dart';

class ProductsSearchBloc extends Bloc<ProductsSearchEvent, ProductsSearchState> {
  final ProductRemoteDataSource _productRemoteDataSource;
  ProductsSearchBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetProductsByName>((event, emit) async {
      emit(const ProductsSearchState.loading());
      final response = await _productRemoteDataSource.getProductsByName(event.query);
      response.fold(
        (l) => emit(const ProductsSearchState.error("Internal Server Error")),
        (r) => emit(ProductsSearchState.loaded(r.products!.data!))
      );
    });
  }
}
