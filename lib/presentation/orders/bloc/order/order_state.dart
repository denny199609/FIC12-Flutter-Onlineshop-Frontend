part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.loaded(OrderResponseModel orderResponseModel) = _Loaded;
  const factory OrderState.error() = _Error;
}
