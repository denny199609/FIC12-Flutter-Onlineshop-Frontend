// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/datasources/rajaongkir_remote_datasource.dart';

import '../../../../data/models/responses/tracking_response_model.dart';

part 'tracking_bloc.freezed.dart';
part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final RajaongkirRemoteDataSource rajaongkirRemoteDataSource;
  TrackingBloc(
    this.rajaongkirRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetTracking>((event, emit) async {
      //loading
      emit(const _Loading());
      final result = await rajaongkirRemoteDataSource.getTracking(
          event.noResi, event.kurir);
      result.fold((l) {
        emit(const _Error());
      }, (r) {
        emit(_Loaded(r));
      });
    });
  }
}
