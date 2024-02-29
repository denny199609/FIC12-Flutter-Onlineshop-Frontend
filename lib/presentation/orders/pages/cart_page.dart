import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_apps/data/datasources/auth_local_datasource.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/cart_item/cart_item_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../../home/models/product_model.dart';
import '../../home/models/store_model.dart';
import '../models/cart_model.dart';
import '../widgets/cart_tile.dart';
import 'package:badges/badges.dart' as badges;

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          BlocBuilder<CartItemBloc, CartItemState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (cartItems, _, __, ___, ____, _____) {
                  final totalQuantity = cartItems.fold<int>(
                      0,
                      (previousValue, element) =>
                          previousValue + element.quantity);
                  return totalQuantity > 0
                      ? badges.Badge(
                          badgeContent: Text(totalQuantity.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                          child: IconButton(
                            onPressed: () {
                              context.goNamed(
                                RouteConstants.cart,
                                pathParameters: PathParameters().toMap(),
                              );
                            },
                            icon: Assets.icons.cart.svg(height: 24.0),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            context.goNamed(
                              RouteConstants.cart,
                              pathParameters: PathParameters().toMap(),
                            );
                          },
                          icon: Assets.icons.cart.svg(height: 24.0),
                        );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          const SizedBox(width: 16.0),
          // IconButton(
          //   onPressed: () {
          //     context.goNamed(
          //       RouteConstants.cart,
          //       pathParameters: PathParameters(
          //         rootTab: RootTab.order,
          //       ).toMap(),
          //     );
          //   },
          //   icon: Assets.icons.cart.svg(height: 24.0),
          // ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          BlocBuilder<CartItemBloc, CartItemState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const SizedBox.shrink();
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
              // return ListView.separated(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: carts.length,
              //   itemBuilder: (context, index) => CartTile(
              //     data: CartModel(
              //       product: carts[index],
              //       quantity: 1,
              //     ),
              //   ),
              //   separatorBuilder: (context, index) => const SpaceHeight(16.0),
              // );
            },
          ),
          const SpaceHeight(50.0),
          Row(
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CartItemBloc, CartItemState>(
                builder: (context, state) {
                  //return totalprice of cart
                  return state.maybeWhen(loaded: (carts, _, __, ___, ____, _____) {
                    return Text(
                      carts
                          .fold<int>(
                            0,
                            (previousValue, element) =>
                                previousValue +
                                element.product.price! * element.quantity,
                          )
                          .currencyFormatRp,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }, orElse: () {
                    return const Text('0');
                  });
                  // return Text(
                  //   350000.currencyFormatRp,
                  //   style: const TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // );
                },
              ),
            ],
          ),
          const SpaceHeight(40.0),
          BlocBuilder<CartItemBloc, CartItemState>(
            builder: (context, state) {
              final totalQty = state.maybeWhen(loaded: (carts, _, __, ___, ____, _____) {
                return carts
                    .fold<int>(
                      0,
                      (previousValue, element) =>
                          previousValue + element.quantity,
                    )
                    .toString();
              }, orElse: () {
                return '0';
              });

              return Button.filled(
                onPressed: () async {
                  final isAuth = await AuthLocalDataSource().isAuth();
                  if (!isAuth) {
                    context.pushNamed(
                      RouteConstants.login,
                    );
                  } else {
                    context.pushNamed(
                      RouteConstants.address,
                      pathParameters: PathParameters(rootTab: RootTab.order).toMap(),
                    );
                  }
                },
                label: 'Checkout ($totalQty)',
              );
            },
          ),
        ],
      ),
    );
  }
}
