import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_apps/core/router/app_router.dart';
import 'package:flutter_onlineshop_apps/data/models/requests/address_request_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/province_response_model.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/subdistrict_response_model.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_dropdown.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
import '../../../data/models/responses/city_response_model.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final firstNameController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    context.read<ProvinceBloc>().add(const ProvinceEvent.getProvince());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Province selectedProvince = Province(
      provinceId: '',
      province: '',
    );

    City selectedCity = City(
      cityId: '',
      cityName: '',
    );

    Subdistrict selectedSubdistrict = Subdistrict(
      subdistrictId: '',
      subdistrictName: '',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Adress'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // ValueListenableBuilder(
          //   valueListenable: countryNotifier,
          //   builder: (context, value, _) => CustomDropdown(
          //     value: value,
          //     items: country,
          //     label: 'Negara atau wilayah',
          //     onChanged: (value) => countryNotifier.value = value ?? '',
          //   ),
          // ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: firstNameController,
            label: 'Nama',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: addressController,
            label: 'Alamat jalan',
          ),
          // const SpaceHeight(24.0),
          // CustomTextField(
          //   controller: cityController,
          //   label: 'Kota',
          // ),
          // const SpaceHeight(24.0),
          // CustomTextField(
          //   controller: provinceController,
          //   label: 'Provinsi',
          // ),
          const SpaceHeight(24.0),
          BlocBuilder<ProvinceBloc, ProvinceState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(child: CircularProgressIndicator());
                },
                loaded: (provinces) {
                  selectedProvince = provinces.first;
                  return CustomDropdown<Province>(
                    value: selectedProvince,
                    items: provinces,
                    label: 'Provinsi',
                    onChanged: (value) {
                      setState(() {
                        selectedProvince = value!;
                        context.read<CityBloc>().add(
                            CityEvent.getCity(selectedProvince.provinceId!));
                      });
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Text(message),
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(child: SizedBox.shrink());
                },
                loaded: (city) {
                  selectedCity = city.first;
                  return CustomDropdown<City>(
                    value: selectedCity,
                    items: city,
                    label: 'Kota',
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                        context.read<SubdistrictBloc>().add(
                            SubdistrictEvent.getSubdistrict(
                                selectedCity.cityId!));
                      });
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Text(message),
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<SubdistrictBloc, SubdistrictState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(child: SizedBox.shrink());
                },
                loaded: (subdistrict) {
                  selectedSubdistrict = subdistrict.first;
                  return CustomDropdown<Subdistrict>(
                    value: selectedSubdistrict,
                    items: subdistrict,
                    label: 'Kecamatan',
                    onChanged: (value) {
                      setState(() {});
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Text(message),
              );
            },
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: zipCodeController,
            label: 'Kode Pos',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: phoneNumberController,
            label: 'No Handphone',
          ),
          const SpaceHeight(24.0),
          BlocConsumer<AddAddressBloc, AddAddressState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  loaded: () {
                    context.goNamed(
                      RouteConstants.address,
                      pathParameters:
                          PathParameters(rootTab: RootTab.order).toMap(),
                    );
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Button.filled(
                    onPressed: () {
                      context
                          .read<AddAddressBloc>()
                          .add(AddAddressEvent.addAddress(AddressRequestModel(
                            name: firstNameController.text,
                            fullAddress: addressController.text,
                            phone: phoneNumberController.text,
                            provId: selectedProvince.provinceId,
                            cityId: selectedCity.cityId,
                            districtId: selectedSubdistrict.subdistrictId,
                            postalCode: zipCodeController.text,
                            isDefault: 0,
                          )));
                    },
                    label: 'Tambah Alamat',
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}
