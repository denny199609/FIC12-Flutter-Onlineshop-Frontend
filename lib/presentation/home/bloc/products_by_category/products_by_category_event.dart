part of 'products_by_category_bloc.dart';

@freezed
class ProductsByCategoryEvent with _$ProductsByCategoryEvent {
  const factory ProductsByCategoryEvent.started() = _Started;
  const factory ProductsByCategoryEvent.getProductsByCategory(String category) = _GetProductsByCategory;
}