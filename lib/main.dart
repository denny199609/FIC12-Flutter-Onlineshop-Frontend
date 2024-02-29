import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_apps/core/constants/colors.dart';
import 'package:flutter_onlineshop_apps/data/datasources/address_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/datasources/category_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/datasources/order_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/datasources/product_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/address/address_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/cart_item/cart_item_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/category/category_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/products_by_category/products_by_category_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/home/bloc/products_search/products_search_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/orders/bloc/history_order/history_order_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/orders/bloc/order/order_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/orders/bloc/status_order/status_order_bloc.dart';
import 'package:flutter_onlineshop_apps/presentation/orders/bloc/tracking/tracking_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/router/app_router.dart';
import 'data/datasources/firebase_messaging_remote_datasource.dart';
import 'presentation/orders/bloc/cost/cost_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'presentation/orders/bloc/order_detail/order_detail_bloc.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingRemoteDatasource().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(CategoryRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => BestSellerProductBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => ProductsByCategoryBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => ProductsSearchBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => CartItemBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => AddressBloc(AddressRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => AddAddressBloc(AddressRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => ProvinceBloc(RajaongkirRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => CityBloc(RajaongkirRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => SubdistrictBloc(RajaongkirRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => TrackingBloc(RajaongkirRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => CostBloc(RajaongkirRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => OrderBloc(OrderRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => StatusOrderBloc(OrderRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => HistoryOrderBloc(OrderRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(OrderRemoteDataSource()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
