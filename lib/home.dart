import 'package:ecommerceuser/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerceuser/screens/product_detail.dart';
import 'package:ecommerceuser/widgets/productscart2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/productscard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<CatagoriesFilter> filters = <CatagoriesFilter>{};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 150,
                //   decoration: BoxDecoration(
                //     color: const Color.fromARGB(255, 104, 103, 103),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Featured",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const ProductsCard2();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Catagories",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View All",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            padding: const EdgeInsets.only(right: 0),
                            showCheckmark: false,
                            label: const Text('Catagories'),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                } else {}
                              });
                            },
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<ProductsCubit, ProductsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ProductFetched) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                      product: state.productList[index]),
                                ),
                              );
                            },
                            child: ProductsCard(
                              product: state.productList[index],
                            ),
                          );
                        },
                      );
                    } else if (state is ProductsFetchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductsFetchError) {
                      return Text(state.message);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum CatagoriesFilter { walking, running, cycling, hiking, Electronics, Beauty }
