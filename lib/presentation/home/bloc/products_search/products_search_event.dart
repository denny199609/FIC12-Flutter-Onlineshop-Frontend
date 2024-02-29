part of 'products_search_bloc.dart';

@freezed
class ProductsSearchEvent with _$ProductsSearchEvent {
  const factory ProductsSearchEvent.started() = _Started;
  const factory ProductsSearchEvent.getProductsByName(String query) = _GetProductsByName;
}