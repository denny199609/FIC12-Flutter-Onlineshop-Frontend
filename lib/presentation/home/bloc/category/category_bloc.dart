// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/datasources/category_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/category_response_model.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDataSource _categoryRemoteDataSource;
  CategoryBloc(
    this._categoryRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetCategory>((event, emit) async {
      emit(const CategoryState.loading());
      final response = await _categoryRemoteDataSource.getCategories();
      response.fold(
        (l) => emit(const CategoryState.error("Internal Server Error")),
        (r) => emit(CategoryState.loaded(r.category!)),
        
      );
    });
  }
}
