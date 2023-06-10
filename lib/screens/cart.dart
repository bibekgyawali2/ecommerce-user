import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubit/order_cubit_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubitCubit, OrderCubitState>(
      builder: (context, state) {
        if (state is OrderFetched) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cart",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      itemCount: state.orderList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 88,
                              child: AspectRatio(
                                aspectRatio: 0.88,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            state.orderList[index].img!)),
                                    color: const Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.orderList[index].title}',
                                  style: const TextStyle(fontSize: 16),
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 10),
                                Text.rich(
                                  TextSpan(
                                    text: "Rs.1000",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                          text:
                                              " x ${state.orderList[index].qty}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                try {
                                  BlocProvider.of<OrderCubitCubit>(context)
                                      .deleteCartItems(
                                          state.orderList[index].cartId);

                                  BlocProvider.of<OrderCubitCubit>(context)
                                      .getCart();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content:
                                          Text('Items Deleted Successfully'),
                                    ),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                          'Item Cannot be Deleted At the Moment'),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is OrderCubitLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Text('error');
        }
      },
    );
  }
}
