part of 'add_address_bloc.dart';

@freezed
class AddAddressState with _$AddAddressState {
  const factory AddAddressState.initial() = _Initial;
  //loading
  const factory AddAddressState.loading() = _Loading;
  //loaded
  const factory AddAddressState.loaded() = _Loaded;
  //error
  const factory AddAddressState.error(String message) = _Error;
}
