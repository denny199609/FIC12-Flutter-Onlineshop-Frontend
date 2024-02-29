import 'package:flutter/material.dart';
import 'package:flutter_onlineshop_apps/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

import '../constants/colors.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;

  const SearchInput({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        onTap: onTap,
        onFieldSubmitted: (value) {
          context.pushNamed(RouteConstants.productSearch,
              pathParameters: PathParameters().toMap(), extra: value);
        },
        // readOnly: onTap != null,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Cari Produk di sini',
          suffixIcon: const Icon(
            Icons.search,
          ),
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColors.light),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColors.light),
          ),
        ),
      ),
    );
  }
}
