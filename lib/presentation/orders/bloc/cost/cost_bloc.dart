// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_apps/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/models/responses/cost_response_model.dart';

part 'cost_bloc.freezed.dart';
part 'cost_event.dart';
part 'cost_state.dart';

class CostBloc extends Bloc<CostEvent, CostState> {
  final RajaongkirRemoteDataSource rajaongkirRemoteDataSource;
  CostBloc(
    this.rajaongkirRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetCost>((event, emit) async {
      //loading
      emit(const _Loading());
      final result = await rajaongkirRemoteDataSource.getCost(
          event.origin, event.destination, 'jne');
      result.fold((l) {
        emit(const _Error());
      }, (r) {
        emit(_Loaded(r));
      });
    });
  }
}
