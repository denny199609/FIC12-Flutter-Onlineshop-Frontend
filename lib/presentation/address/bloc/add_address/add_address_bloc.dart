// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_apps/data/datasources/address_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/models/requests/address_request_model.dart';

part 'add_address_bloc.freezed.dart';
part 'add_address_event.dart';
part 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final AddressRemoteDataSource _addressRemoteDataSource;
  AddAddressBloc(
    this._addressRemoteDataSource,
  ) : super(const _Initial())  {
    on<_addAddress>((event, emit) async {
      emit(const _Loading());
      final responses = await _addressRemoteDataSource.addAddress(event.address);
      responses.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
