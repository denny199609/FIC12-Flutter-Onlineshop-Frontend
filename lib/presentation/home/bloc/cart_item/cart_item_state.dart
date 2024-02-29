part of 'cart_item_bloc.dart';

@freezed
class CartItemState with _$CartItemState {
  const factory CartItemState.initial() = _Initial;
  const factory CartItemState.loading() = _Loading;
  const factory CartItemState.loaded(
      List<CartItem> cartItems,
      int addressId,
      String paymentMethod,
      String shippingService,
      int shippingCost,
      String paymentVaName) = _Loaded;
  const factory CartItemState.error(String message) = _Error;
}
