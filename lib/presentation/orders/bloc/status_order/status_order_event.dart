part of 'status_order_bloc.dart';

@freezed
class StatusOrderEvent with _$StatusOrderEvent {
  const factory StatusOrderEvent.started() = _Started;
  const factory StatusOrderEvent.checkStatusOrder(String id) = _CheckStatusOrder;
}