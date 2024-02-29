import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/product_response_model.dart';
import 'package:flutter_onlineshop_apps/presentation/home/models/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_event.dart';
part 'cart_item_state.dart';
part 'cart_item_bloc.freezed.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  CartItemBloc() : super(const _Loaded([], 0, '', '', 0, '')) {
    on<_AddCartItem>((event, emit) {
      final currentState = state as _Loaded;
      //if product is already in cart add quantity
      if (currentState.cartItems
          .any((element) => element.product.id == event.product.id)) {
        //check index
        final index = currentState.cartItems
            .indexWhere((element) => element.product.id == event.product.id);
        //item
        final item = currentState.cartItems[index];
        //new Item + 1 quantity
        final newItem = item.copyWith(quantity: item.quantity + 1);
        //update
        final newItems =
            currentState.cartItems.map((e) => e == item ? newItem : e).toList();
        emit(_Loaded(newItems, 
          currentState.addressId,
          currentState.paymentMethod,
          currentState.shippingService,
          currentState.shippingCost,
          currentState.paymentVaName));
      } else {
        emit(_Loaded([
          ...currentState.cartItems,
          CartItem(product: event.product, quantity: 1)
        ], 
          currentState.addressId,
          currentState.paymentMethod,
          currentState.shippingService,
          currentState.shippingCost,
          currentState.paymentVaName));
      }
    });

    on<_RemoveCartItem>((event, emit) {
      final currentState = state as _Loaded;
      //if product is already in cart add quantity
      if (currentState.cartItems
          .any((element) => element.product.id == event.product.id)) {
        //check index
        final index = currentState.cartItems
            .indexWhere((element) => element.product.id == event.product.id);
        //item
        final item = currentState.cartItems[index];

        //if item is 1 remove
        if (item.quantity == 1) {
          //update
          final newItems = currentState.cartItems
              .where((element) => element.product.id != event.product.id)
              .toList();
          emit(_Loaded(newItems, 
          currentState.addressId,
          currentState.paymentMethod,
          currentState.shippingService,
          currentState.shippingCost,
          currentState.paymentVaName));
        } else {
          //new Item - 1 quantity
          final newItem = item.copyWith(quantity: item.quantity - 1);
          //update
          final newItems = currentState.cartItems
              .map((e) => e == item ? newItem : e)
              .toList();
          emit(_Loaded(newItems, 
          currentState.addressId,
          currentState.paymentMethod,
          currentState.shippingService,
          currentState.shippingCost,
          currentState.paymentVaName));
        }
      }
    });

    on<_AddAddressId>((event, emit) {
      final currentState = state as _Loaded;

      emit(_Loaded(
          currentState.cartItems,
          event.addressId,
          currentState.paymentMethod,
          currentState.shippingService,
          currentState.shippingCost,
          currentState.paymentVaName));
    });

    
    on<_AddPaymentMethod>((event, emit) {
      final currentState = state as _Loaded;

      emit(_Loaded(
          currentState.cartItems,
          currentState.addressId,
          'bank_transfer',
          currentState.shippingService,
          currentState.shippingCost,
          event.paymentMethod));
    });

    
    on<_AddShippingService>((event, emit) {
      final currentState = state as _Loaded;

      emit(_Loaded(
          currentState.cartItems,
          currentState.addressId,
          currentState.paymentMethod,
          event.shippingService,
          event.shippingCost,
          currentState.paymentVaName));
    });

    
    on<_Started>((event, emit) {
      emit(const _Loaded([], 0, '', '', 0, ''));
    });
  }
}
