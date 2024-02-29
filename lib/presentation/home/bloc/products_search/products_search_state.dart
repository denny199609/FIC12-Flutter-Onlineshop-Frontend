part of 'products_search_bloc.dart';

@freezed
class ProductsSearchState with _$ProductsSearchState {
  const factory ProductsSearchState.initial() = _Initial;
  const factory ProductsSearchState.loading() = _Loading;
  const factory ProductsSearchState.loaded(List<Product> products) = _Loaded;
  const factory ProductsSearchState.error(String message) = _Error;
}
