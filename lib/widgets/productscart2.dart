import 'package:flutter/material.dart';

class ProductsCard2 extends StatelessWidget {
  //ProductsModel productsModel;
  const ProductsCard2({
    //required this.productsModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 15),
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFjYm9vayUyMHByb3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Product Long Name',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Rs.100",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.orange,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Rs.100',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: Row(
          //     children: [
          //       RatingBarIndicator(
          //         rating: 4,
          //         itemBuilder: (context, index) => const Icon(
          //           Icons.star,
          //           color: Colors.amber,
          //         ),
          //         itemCount: 5,
          //         itemSize: 17.0,
          //         direction: Axis.horizontal,
          //       ),
          //       const Text(
          //         '(12)',
          //         style: TextStyle(color: Colors.grey, fontSize: 11),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
