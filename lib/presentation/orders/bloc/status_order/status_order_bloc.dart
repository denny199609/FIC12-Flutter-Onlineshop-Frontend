// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/datasources/order_remote_datasource.dart';

part 'status_order_bloc.freezed.dart';
part 'status_order_event.dart';
part 'status_order_state.dart';

class StatusOrderBloc extends Bloc<StatusOrderEvent, StatusOrderState> {
  final OrderRemoteDataSource orderRemoteDataSource;
  StatusOrderBloc(
    this.orderRemoteDataSource,
  ) : super(const _Initial()) {
    on<_CheckStatusOrder>((event, emit) async {
      emit(const _Loading());

      final result = await orderRemoteDataSource.getStatusOrder(event.id);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
