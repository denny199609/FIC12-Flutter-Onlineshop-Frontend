part of 'province_bloc.dart';

@freezed
class ProvinceState with _$ProvinceState {
  const factory ProvinceState.initial() = _Initial;
  //loading
  const factory ProvinceState.loading() = _Loading;
  //loaded
  const factory ProvinceState.loaded(List<Province> provinces) = _Loaded;
  //error
  const factory ProvinceState.error(String message) = _Error;
  
}
