import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Number: 1001',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Status: Delivered',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Total Price: \$69.97',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Shipping Address:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '123 Street, City',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Payment Method:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Credit Card',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Order Items:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            buildProductItem(
              Product(
                name: 'Product 1',
                imageUrl: 'https://example.com/product1.jpg',
                quantity: 2,
                price: 19.99,
              ),
            ),
            buildProductItem(
              Product(
                name: 'Product 2',
                imageUrl: 'https://example.com/product2.jpg',
                quantity: 1,
                price: 29.99,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductItem(Product product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Image.network(
          product.imageUrl,
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
        title: Text(
          product.name,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Quantity: ${product.quantity}',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[700],
          ),
        ),
        trailing: Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final int quantity;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
}
