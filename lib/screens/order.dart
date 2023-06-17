import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return buildOrderContainer(orders[index]);
        },
      ),
    );
  }

  Widget buildOrderContainer(Order order) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order #${order.orderNumber}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: _getStatusColor(order.status),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  order.status,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            'Total: \$${order.totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status == 'Delivered') {
      return Colors.green;
    } else if (status == 'Processing') {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

class Order {
  final int orderNumber;
  final String status;
  final double totalPrice;

  Order({
    required this.orderNumber,
    required this.status,
    required this.totalPrice,
  });
}

List<Order> orders = [
  Order(
    orderNumber: 1001,
    status: 'Delivered',
    totalPrice: 69.97,
  ),
  Order(
    orderNumber: 1002,
    status: 'Processing',
    totalPrice: 29.97,
  ),
  Order(
    orderNumber: 1003,
    status: 'Cancelled',
    totalPrice: 129.97,
  ),
];
