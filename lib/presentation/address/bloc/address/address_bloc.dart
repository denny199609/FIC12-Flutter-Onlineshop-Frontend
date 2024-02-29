// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/datasources/address_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/address_response_model.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRemoteDataSource _addressRemoteDataSource;
  AddressBloc(
    this._addressRemoteDataSource,
  ) : super(const _Initial()) {
    on<_getAddress>((event, emit) async {
      emit(const _Loading());
      final responses = await _addressRemoteDataSource.getAddresses();
      responses.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.data ?? [])));
    });
  }
}
