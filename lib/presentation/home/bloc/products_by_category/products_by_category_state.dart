part of 'products_by_category_bloc.dart';

@freezed
class ProductsByCategoryState with _$ProductsByCategoryState {
  const factory ProductsByCategoryState.initial() = _Initial;
  const factory ProductsByCategoryState.loading() = _Loading;
  const factory ProductsByCategoryState.loaded(List<Product> products) = _Loaded;
  const factory ProductsByCategoryState.error(String message) = _Error;
}
