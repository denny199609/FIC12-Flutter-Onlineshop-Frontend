import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_apps/data/datasources/product_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';
part 'all_product_bloc.freezed.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDataSource _productRemoteDataSource;
  AllProductBloc(this._productRemoteDataSource) : super(const _Initial()) {
    on<_GetProducts>((event, emit) async {
      emit(const AllProductState.loading());
      final response = await _productRemoteDataSource.getProducts();
      response.fold(
        (l) => emit(const AllProductState.error("Internal Server Error")),
        (r) => emit(AllProductState.loaded(r.products!.data!))
      );
    });
  }
}
