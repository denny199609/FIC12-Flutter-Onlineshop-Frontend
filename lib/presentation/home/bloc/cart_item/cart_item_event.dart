part of 'cart_item_bloc.dart';

@freezed
class CartItemEvent with _$CartItemEvent {
  const factory CartItemEvent.started() = _Started;
  const factory CartItemEvent.AddCartItem(Product product) = _AddCartItem;
  const factory CartItemEvent.RemoveCartItem(Product product) = _RemoveCartItem;
  //add address id
  const factory CartItemEvent.AddAddressId(int addressId) = _AddAddressId;
  //add payment method
  const factory CartItemEvent.AddPaymentMethod(String paymentMethod) = _AddPaymentMethod;
  //add shipping service
  const factory CartItemEvent.AddShippingService(String shippingService, int shippingCost) = _AddShippingService;
}