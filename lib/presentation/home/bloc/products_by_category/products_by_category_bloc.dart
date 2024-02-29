// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/product_remote_datasource.dart';
import '../../../../data/models/responses/product_response_model.dart';

part 'products_by_category_bloc.freezed.dart';
part 'products_by_category_event.dart';
part 'products_by_category_state.dart';

class ProductsByCategoryBloc extends Bloc<ProductsByCategoryEvent, ProductsByCategoryState> {
  final ProductRemoteDataSource _productRemoteDataSource;
  ProductsByCategoryBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetProductsByCategory>((event, emit) async {
      emit(const ProductsByCategoryState.loading());
      final response = await _productRemoteDataSource.getProductsByCategory(event.category);
      response.fold(
        (l) => emit(const ProductsByCategoryState.error("Internal Server Error")),
        (r) => emit(ProductsByCategoryState.loaded(r.products!.data!)),
      );
    });
  }
}
