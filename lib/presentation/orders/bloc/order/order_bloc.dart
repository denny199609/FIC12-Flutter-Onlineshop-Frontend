// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_apps/data/models/requests/order_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/datasources/order_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/order_response_model.dart';
import 'package:flutter_onlineshop_apps/presentation/home/models/cart_model.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDataSource orderRemoteDataSource;
  OrderBloc(
    this.orderRemoteDataSource,
  ) : super(const _Initial()) {
    on<_doOrder>((event, emit) async {
      //loading
      emit(const _Loading());
      final orderRequestModel = OrderRequestModel(
        addressId: event.addressId,
        paymentMethod: event.paymentMethod,
        shippingService: event.shippingService,
        shippingCost: event.shippingCost,
        paymentVaName: event.paymentVAName,
        subtotal: 0,
        totalCost: 0,
        //map
        items: event.cartItems
            .map((e) => Item(
                  productId: e.product.id,
                  quantity: e.quantity,
                ))
            .toList(),
      );
      final response = await  orderRemoteDataSource.createOrder(orderRequestModel);
      // response.fold((l) {
      //   emit(const _Error());
      // }, (r) {
      //   emit(_Loaded(r));
      // });
      response.fold((l) {
        emit(const _Error());
      }, (r) {
        emit(_Loaded(r));
      });
    });
  }
}
