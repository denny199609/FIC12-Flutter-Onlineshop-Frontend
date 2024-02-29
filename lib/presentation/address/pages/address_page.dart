import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/address/address_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/models/cart_model.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../../home/bloc/cart_item/cart_item_bloc.dart';
import '../models/address_model.dart';
import '../widgets/address_tile.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    context.read<AddressBloc>().add(const AddressEvent.getAddress());
    super.initState();
  }

  final List<AddressModel> addresses = [
    AddressModel(
      country: 'Indonesia',
      firstName: 'Saiful',
      lastName: 'Bahri',
      address: 'Jl. Merdeka No. 123',
      city: 'Jakarta Selatan',
      province: 'DKI Jakarta',
      zipCode: 12345,
      phoneNumber: '08123456789',
      isPrimary: true,
    ),
    AddressModel(
      country: 'Indonesia',
      firstName: 'Saiful',
      lastName: '',
      address: 'Jl. Cendrawasih No. 456',
      city: 'Bandung',
      province: 'Jawa Barat',
      zipCode: 67890,
      phoneNumber: '08987654321',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // int selectedIndex = addresses.indexWhere((element) => element.isPrimary);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(
                RouteConstants.cart,
                pathParameters: PathParameters(
                  rootTab: RootTab.order,
                ).toMap(),
              );
            },
            icon: Assets.icons.cart.svg(height: 24.0),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text(
            'Pilih atau tambahkan alamat pengiriman',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SpaceHeight(20.0),
          BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const CircularProgressIndicator();
              }, error: (message) {
                return Center(
                  child: Text(message),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, loaded: (addresses) {
                return BlocBuilder<CartItemBloc, CartItemState>(
                  builder: (context, state) {
                    final addressID = state.maybeWhen(
                        orElse: () => 0,
                        loaded: (_, addressID, ___, ____, _____, ______) {
                          return addressID;
                        });
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: addresses.length,
                      itemBuilder: (context, index) => AddressTile(
                        isSelected: addressID == addresses[index].id,
                        data: addresses[index],
                        onTap: () {
                          context.read<CartItemBloc>().add(
                              CartItemEvent.AddAddressId(addresses[index].id!));
                        },
                        onEditTap: () {
                          context.goNamed(
                            RouteConstants.editAddress,
                            pathParameters: PathParameters(
                              rootTab: RootTab.order,
                            ).toMap(),
                            extra: addresses[index],
                          );
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          const SpaceHeight(16.0),
                    );
                  },
                );
              });
            },
          ),
          const SpaceHeight(40.0),
          Button.outlined(
            onPressed: () {
              context.pushNamed(
                RouteConstants.addAddress,
                pathParameters: PathParameters(
                  rootTab: RootTab.order,
                ).toMap(),
              );
            },
            label: 'Add address',
          ),
          const SpaceHeight(50.0),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal (Estimasi)',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                BlocBuilder<CartItemBloc, CartItemState>(
                  builder: (context, state) {
                    final totalEstimated = state.maybeWhen(
                      orElse: () => 0,
                      loaded: (carts, _, __, ___, ____, _____) {
                        return carts.fold<int>(
                          0,
                          (previousValue, element) =>
                              previousValue + element.product.price! * element.quantity,
                        );
                      },
                    );
                    return Text(
                      totalEstimated.currencyFormatRp,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SpaceHeight(12.0),
            Button.filled(
              onPressed: () {
                context.goNamed(
                  RouteConstants.orderDetail,
                  pathParameters: PathParameters(
                    rootTab: RootTab.order,
                  ).toMap(),
                );
              },
              label: 'Lanjutkan',
            ),
          ],
        ),
      ),
    );
  }
}
