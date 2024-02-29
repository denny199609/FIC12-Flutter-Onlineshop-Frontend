import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_apps/data/datasources/product_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'best_seller_product_event.dart';
part 'best_seller_product_state.dart';
part 'best_seller_product_bloc.freezed.dart';

class BestSellerProductBloc extends Bloc<BestSellerProductEvent, BestSellerProductState> {
  final ProductRemoteDataSource _productRemoteDataSource;
  BestSellerProductBloc(this._productRemoteDataSource) : super(const _Initial()) {
    on<_GetBestSellerProduct>((event, emit) async {
      emit(const BestSellerProductState.loading());
      final response = await _productRemoteDataSource.getProductsByCategory("1");
      response.fold(
        (l) => emit(const BestSellerProductState.error("Internal Server Error")),
        (r) => emit(BestSellerProductState.loaded(r.products!.data!))
      );
    });
  }
}
