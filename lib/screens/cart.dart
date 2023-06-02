import 'package:ecommerceuser/cubits/order_cubit/order_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                                    color: const Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.network(state.orderList[1].img!),
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
                            )
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
