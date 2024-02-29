// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_onlineshop_apps/core/components/spaces.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/products_by_category/products_by_category_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/search_input.dart';
import '../../../core/router/app_router.dart';
import '../bloc/cart_item/cart_item_bloc.dart';
import '../widgets/organism/product_list.dart';

import 'package:badges/badges.dart' as badges;

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final searchController = TextEditingController();
  @override
  void initState() {
    context
        .read<ProductsByCategoryBloc>()
        .add(ProductsByCategoryEvent.getProductsByCategory(widget.category));
    super.initState();
  }

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
      body: ListView(padding: const EdgeInsets.all(20.0), children: [
        // Text(widget.category),

        SearchInput(
          controller: searchController,
          onTap: () {},
        ),
        const SpaceHeight(16.0),
        BlocBuilder<ProductsByCategoryBloc, ProductsByCategoryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (products) => ProductList(
                title: products[0].category!.name!,
                onSeeAllTap: () {}, 
                items: products,
              ),
              orElse: () {
                return const SizedBox();
              },
              error: (message) => Center(child: Text(message)),
              loading: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ]),
    );
  }
}
