// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_onlineshop_apps/core/constants/variables.dart';
import 'package:flutter_onlineshop_apps/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../data/models/responses/product_response_model.dart';

class ProductTileCard extends StatelessWidget {
  final Product data;
  const ProductTileCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.goNamed(
            RouteConstants.productDetail,
            pathParameters: PathParameters().toMap(),
            extra: data,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.stroke),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                   data.image!.contains('http') ? data.image! : Variables.baseUrlImage + data.image!,
                   width: 68.0,
                  height: 68.0,
                ),
              ),
              const SpaceWidth(14.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '${data.price!.currencyFormatRp}',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
