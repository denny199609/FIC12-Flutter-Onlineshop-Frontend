// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/responses/order_detail_response_model.dart';

part 'order_detail_bloc.freezed.dart';
part 'order_detail_event.dart';
part 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  final OrderRemoteDataSource orderRemoteDataSource;
  OrderDetailBloc(
    this.orderRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetDetailOrder>((event, emit) async{
      //loading
      emit(const _Loading());
      final result = await orderRemoteDataSource.getOrderById(event.id);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.order!)),
      );
    });
  }
}
