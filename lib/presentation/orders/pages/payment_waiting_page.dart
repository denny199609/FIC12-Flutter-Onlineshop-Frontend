// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/cart_item/cart_item_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/orders/bloc/status_order/status_order_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_onlineshop_apps/presentation/orders/models/bank_account_model.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../bloc/order/order_bloc.dart';
import '../widgets/countdown_timer.dart';

class PaymentWaitingPage extends StatefulWidget {
  const PaymentWaitingPage({
    Key? key,
    required this.orderID,
  }) : super(key: key);
  final int orderID;
  @override
  State<PaymentWaitingPage> createState() => _PaymentWaitingPageState();
}

class _PaymentWaitingPageState extends State<PaymentWaitingPage> {
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      //cek pembayaran setiap 5 detik
      context
          .read<StatusOrderBloc>()
          .add(StatusOrderEvent.checkStatusOrder(widget.orderID.toString()));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void onTimerCompletion() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                child: ColoredBox(
                  color: AppColors.light,
                  child: SizedBox(height: 8.0, width: 55.0),
                ),
              ),
              const SpaceHeight(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pembayaran berhasil',
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
              const SpaceHeight(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Assets.images.processOrder.image(),
              ),
              const SpaceHeight(50.0),
              Row(
                children: [
                  Flexible(
                    child: Button.outlined(
                      onPressed: () {
                        context.pushNamed(
                          RouteConstants.trackingOrder,
                          pathParameters: PathParameters().toMap(),
                        );
                      },
                      label: 'Lacak Pesanan',
                    ),
                  ),
                  const SpaceWidth(20.0),
                  Flexible(
                    child: Button.filled(
                      onPressed: () {
                        context.goNamed(
                          RouteConstants.root,
                          pathParameters: PathParameters().toMap(),
                        );
                      },
                      label: 'Back to Home',
                    ),
                  ),
                ],
              ),
              const SpaceHeight(20.0),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waiting for payment'),
      ),
      body: BlocListener<StatusOrderBloc, StatusOrderState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              loaded: (status) {
                if (status == 'paid') {
                  context
                      .read<CartItemBloc>()
                      .add(const CartItemEvent.started());
                  onTimerCompletion();
                  _timer?.cancel();
                }
              });
        },
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Row(
              children: [
                const Icon(Icons.schedule),
                const SpaceWidth(12.0),
                const Flexible(
                  child: Text(
                    'Selesaikan Pembayaran Dalam',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SpaceWidth(12.0),
                CountdownTimer(
                  minute: 1,
                  onTimerCompletion: onTimerCompletion,
                ),
              ],
            ),
            const SpaceHeight(20.0),
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return const SizedBox();
                }, loaded: (orderResponseModel) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          banks
                              .where((element) =>
                                  element.code ==
                                  orderResponseModel.data!.paymentVaName!)
                              .first
                              .name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        //use image asset with bank name
                        Image.asset(banks
                            .where((element) =>
                                element.code ==
                                orderResponseModel.data!.paymentVaName!)
                            .first
                            .image),
                        // Assets.images.banks.bca.image(height: 18.0)
                      ]);
                });

                // return Text(
                //   'BRI Virtual Account',
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.w600,
                //   ),
                // );
              },
            ),
            const SpaceHeight(14.0),
            const Divider(),
            const SpaceHeight(14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'No Virtual Account',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    BlocBuilder<OrderBloc, OrderState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const Text(
                              '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                          loaded: (orderResponseModel) {
                            return Row(
                              children: [
                                Text(
                                  orderResponseModel.data!.paymentVaNumber!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                //spacer width
                                const SpaceWidth(30.0),
                                Button.outlined(
                                  textColor: AppColors.primary,
                                  width: 125.0,
                                  onPressed: () {
                                    Clipboard.setData( ClipboardData(
                                            text: orderResponseModel.data!.paymentVaNumber!))
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Copied to clipboard'),
                                        duration: Duration(seconds: 1),
                                        backgroundColor: AppColors.primary,
                                      ));
                                    });
                                  },
                                  label: 'Copy',
                                  icon: Assets.icons.copy.svg(),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SpaceHeight(14.0),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Total Pembayaran',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Text(
                'IDR 377.000',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Button.filled(
              onPressed: () {
                context.goNamed(
                  RouteConstants.root,
                  pathParameters: PathParameters().toMap(),
                );
              },
              label: 'Belanja Lagi',
            ),
            const SpaceHeight(20.0),
            Button.outlined(
              onPressed: () {
                context.pushNamed(
                  RouteConstants.trackingOrder,
                  pathParameters: PathParameters().toMap(),
                );
              },
              label: 'Cek Status Pembayaran',
            ),
          ],
        ),
      ),
    );
  }
}
