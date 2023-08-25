import 'package:ecommerceuser/cubits/order_cubit/order_cubit.dart';
import 'package:ecommerceuser/modals/order_modal.dart';
import 'package:ecommerceuser/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderFetched) {
            return ListView.builder(
                itemCount: state.orderList.length,
                itemBuilder: (context, index) {
                  return buildOrderContainer(state.orderList[index]);
                });
          } else if (state is OrderLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextButton(
                    child: const Text('RETRY'),
                    onPressed: () {
                      BlocProvider.of<OrderCubit>(context).getOrder();
                    },
                  ),
                ),
                const Text("Something Went Wrong "),
              ],
            );
          }
          return const Text('');
        },
      ),
    );
  }

  Widget buildOrderContainer(OrderModal order) {
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
                'Order #${order.orderId}',
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: _getStatusColor(order.orderId),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Text(
                  'placed',
                  style: TextStyle(
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
            order.totalPrice.toString(),
            style: TextStyle(
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
      return Color.fromARGB(255, 54, 67, 244);
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
