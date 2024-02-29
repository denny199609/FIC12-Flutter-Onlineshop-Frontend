// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/datasources/rajaongkir_remote_datasource.dart';

import '../../../../data/models/responses/city_response_model.dart';

part 'city_bloc.freezed.dart';
part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final RajaongkirRemoteDataSource _rajaongkirRemoteDataSource;
  CityBloc(
    this._rajaongkirRemoteDataSource,
  ) : super(const _Initial()) {
    on<_getCity>((event, emit) async {
      emit(const _Loading());
      final responses =
          await _rajaongkirRemoteDataSource.getCityByProvince(event.provID);
      responses.fold((l) => emit(_Error(l)),
          (r) => emit(_Loaded(r.rajaongkir?.results ?? [])));
    });
  }
}
