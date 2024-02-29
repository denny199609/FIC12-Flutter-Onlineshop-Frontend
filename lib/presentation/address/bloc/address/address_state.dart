part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = _Initial;
  //loading
  const factory AddressState.loading() = _Loading;
  //loaded
  const factory AddressState.loaded(List<Address> addresses) = _Loaded;
  //error
  const factory AddressState.error(String message) = _Error;
  
}
