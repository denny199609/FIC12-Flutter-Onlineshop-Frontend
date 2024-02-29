import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/cart_item/cart_item_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/models/cart_model.dart';
import 'package:flutter_onlineshop_apps/presentation/orders/widgets/cart_tile.dart';
import 'package:go_router/go_router.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../../home/models/product_model.dart';
import '../../home/models/store_model.dart';
import '../bloc/cost/cost_bloc.dart';
import '../models/shipping_model.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  void initState() {
    context.read<CostBloc>().add(const CostEvent.getCost(
        origin: '501', destination: '114', weight: 1000, courier: 'jne'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Orders'),
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
          BlocBuilder<CartItemBloc, CartItemState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const SizedBox();
              }, loaded: (carts, _, __, ___, ____, _____) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carts.length,
                  itemBuilder: (context, index) => CartTile(
                    data: carts[index],
                  ),
                  separatorBuilder: (context, index) => const SpaceHeight(16.0),
                );
              });
            },
          ),
          const SpaceHeight(36.0),
          const _SelectShipping(),
          // const _ShippingSelected(),
          const SpaceHeight(36.0),
          const Divider(),
          const SpaceHeight(8.0),
          const Text(
            'Detail Belanja :',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(12.0),
          Row(
            children: [
              const Text(
                'Total Harga (Produk)',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CartItemBloc, CartItemState>(
                builder: (context, state) {
                  final total = state.maybeWhen(
                    orElse: () => 0,
                    loaded: (carts, _, __, ___, ____, _____) {
                      return carts.fold<int>(
                        0,
                        (previousValue, element) =>
                            previousValue +
                            (element.product.price! * element.quantity),
                      );
                    },
                  );

                  return Text(
                    total.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(5.0),
          Row(
            children: [
              const Text(
                'Total Ongkos Kirim',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CartItemBloc, CartItemState>(
                builder: (context, state) {
                  final totalShipping = state.maybeWhen(
                    orElse: () => 0,
                    loaded: (_, __, ___, ____, shippingCost_, _____) {
                      return shippingCost_;
                    },
                  );

                  return Text(
                    totalShipping.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(8.0),
          const Divider(),
          const SpaceHeight(24.0),
          Row(
            children: [
              const Text(
                'Total Belanja',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CartItemBloc, CartItemState>(
                builder: (context, state) {
                  final totalOrder = state.maybeWhen(
                      orElse: () => 0,
                      loaded: (carts, _, __, ___, shippingCost, _____) {
                        return carts.fold<int>(
                                0,
                                (previousValue, element) =>
                                    previousValue +
                                    (element.product.price! *
                                        element.quantity)) +
                            shippingCost;
                      });
                  return Text(
                    totalOrder.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(20.0),
          Button.filled(
            onPressed: () {
              context.goNamed(
                RouteConstants.paymentDetail,
                pathParameters: PathParameters().toMap(),
              );
            },
            label: 'Pilih Pembayaran',
          ),
        ],
      ),
    );
  }
}

class _SelectShipping extends StatelessWidget {
  const _SelectShipping();

  @override
  Widget build(BuildContext context) {
    final selectedPayment = ValueNotifier<int>(0);
    final shippings = [
      ShippingModel(
        type: 'Reguler',
        priceStart: 20000,
        priceEnd: 30000,
        estimate: DateTime.now().subtract(const Duration(days: 3)),
      ),
      ShippingModel(
        type: 'Kargo',
        priceStart: 20000,
        priceEnd: 30000,
        estimate: DateTime.now().subtract(const Duration(days: 3)),
      ),
      ShippingModel(
        type: 'Ekonomi',
        priceStart: 20000,
        priceEnd: 30000,
        estimate: DateTime.now().subtract(const Duration(days: 4)),
      ),
    ];

    void onSelectShippingTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    child: ColoredBox(
                      color: AppColors.light,
                      child: SizedBox(height: 8.0, width: 55.0),
                    ),
                  ),
                ),
                const SpaceHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Metode Pengiriman',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.light,
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(18.0),
                // Container(
                //   decoration: ShapeDecoration(
                //     shape: RoundedRectangleBorder(
                //       side: const BorderSide(
                //         width: 1.50,
                //         color: AppColors.stroke,
                //       ),
                //       borderRadius: BorderRadius.circular(14),
                //     ),
                //   ),
                //   child: ListTile(
                //     leading: Assets.icons.routing.svg(),
                //     subtitle: const Text('Dikirim dari Kabupaten Banyuwangi'),
                //     trailing: const Text(
                //       'berat: 1kg',
                //       textAlign: TextAlign.right,
                //       style: TextStyle(
                //         color: AppColors.primary,
                //         fontSize: 16,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // ),
                // const SpaceHeight(12.0),
                // const Text(
                //   'Estimasi tiba 20 - 23 Januari (Rp. 20.000)',
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                // const SpaceHeight(30.0),
                const Divider(color: AppColors.stroke),
                BlocBuilder<CostBloc, CostState>(
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      return const SizedBox();
                    }, loaded: (shippings) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item =
                              shippings.rajaongkir!.results![0].costs![index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              context.read<CartItemBloc>().add(
                                  CartItemEvent.AddShippingService(
                                      'jne', item.cost![0].value!));
                              context.pop();
                            },
                            title: Text(
                                '${item.description} (${item.cost![0].value!.currencyFormatRp})'),
                            subtitle:
                                Text('Estimasi ${item.cost![0].etd} hari'),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const Divider(color: AppColors.stroke),
                        itemCount:
                            shippings.rajaongkir!.results![0].costs!.length,
                      );
                    });
                  },
                ),
                // ),
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: onSelectShippingTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.stroke),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pilih Pengiriman',
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class _ShippingSelected extends StatelessWidget {
  const _ShippingSelected();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.stroke),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Reguler',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(
                  'Edit',
                  style: TextStyle(fontSize: 16),
                ),
                SpaceWidth(4.0),
                Icon(Icons.chevron_right),
              ],
            ),
            SpaceHeight(12.0),
            Text(
              'JNE (Rp. 25.000)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text('Estimasi tiba 2 Januari 2024'),
          ],
        ),
      ),
    );
  }
}
