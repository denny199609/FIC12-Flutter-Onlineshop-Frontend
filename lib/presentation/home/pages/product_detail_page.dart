// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_onlineshop_apps/core/components/buttons.dart';
import 'package:flutter_onlineshop_apps/core/components/spaces.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/product_response_model.dart';
import 'package:flutter_onlineshop_apps/presentation/home/widgets/product_detail_card.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/router/app_router.dart';
import '../bloc/cart_item/cart_item_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Product data;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
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
          ],
        ),
        body: ListView(padding: const EdgeInsets.all(20.0), children: [
          ProductDetailCard(
            data: widget.data,
          ),
          const SpaceHeight(16.0),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Deskripsi Item',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SpaceHeight(8.0),
            Text(widget.data.description!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 14,
                ))
          ])
        ]),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Flexible(
                child: Button.outlined(
                  onPressed: () {
                    context
                        .read<CartItemBloc>()
                        .add(CartItemEvent.AddCartItem(widget.data));
                  },
                  label: 'Masukkan Keranjang',
                ),
              ),
              const SpaceWidth(20.0),
              Flexible(
                child: Button.filled(
                  onPressed: () {
                    context
                        .read<CartItemBloc>()
                        .add(CartItemEvent.AddCartItem(widget.data));

                    context.goNamed(
                      RouteConstants.cart,
                      pathParameters: PathParameters().toMap(),
                    );
                  },
                  label: 'Beli Sekarang',
                ),
              ),
            ],
          ),
        ));
  }
}
