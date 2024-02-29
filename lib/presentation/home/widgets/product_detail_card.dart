import 'package:flutter/material.dart';
import 'package:flutter_onlineshop_apps/core/components/spaces.dart';
import 'package:flutter_onlineshop_apps/core/constants/colors.dart';
import 'package:flutter_onlineshop_apps/core/constants/variables.dart';
import 'package:flutter_onlineshop_apps/core/extensions/int_ext.dart';
import 'package:flutter_onlineshop_apps/data/models/responses/product_response_model.dart';

class ProductDetailCard extends StatelessWidget {
  final Product data;
  const ProductDetailCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    //return container with product detail and image
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            // width = full left to right , height about 20% of screen
            child: Image.network(
              data.image!.contains('http')
                  ? data.image!
                  : Variables.baseUrlImage + data.image!,
              width: 400,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SpaceHeight(16.0),
          Row(children: [
            const SizedBox(height: 10), // Adjust the height as per your requirement
            Text(
              data.name!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            //give space between text
            const Spacer(),
            Text(
              'Stock: ${data.stock.toString()}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          const SpaceHeight(16.0),
          Text(
            
            data.price!.currencyFormatRp,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
