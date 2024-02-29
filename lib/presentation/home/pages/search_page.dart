import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_apps/core/components/spaces.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/widgets/product_tile_card.dart';
import 'package:flutter_onlineshop_apps/presentation/orders/widgets/product_tile.dart';
import 'package:go_router/go_router.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/search_input.dart';
import '../../../core/constants/colors.dart';
import '../../../core/router/app_router.dart';
import '../bloc/cart_item/cart_item_bloc.dart';
import 'package:badges/badges.dart' as badges;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // late TextEditingController searchController;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // searchController = TextEditingController();
    context
        .read<BestSellerProductBloc>()
        .add(const BestSellerProductEvent.getBestSellerProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
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
          SearchInput(
            controller: searchController,
            
            onTap: () {},
          ),
          const SpaceHeight(16.0),
          const Text(
            'Popular Product',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(16.0),
          BlocBuilder<BestSellerProductBloc, BestSellerProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (products) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) => ProductTileCard(
                        data: products[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const SpaceHeight(16.0),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
