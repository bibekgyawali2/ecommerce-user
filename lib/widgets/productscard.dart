import 'package:ecommerceuser/modals/products_modals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductsCard extends StatelessWidget {
  Product product;
  ProductsCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                product.pImg.toString(),
              ),
            ),
          ),
        ),
        Text(
          product.pName.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          product.pPrice.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: Colors.orange),
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: double.parse(product.pRating!),
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 17.0,
              direction: Axis.horizontal,
            ),
            const Text(
              '(12)',
              style: TextStyle(color: Colors.grey, fontSize: 11),
            )
          ],
        ),
      ],
    );
  }
}
