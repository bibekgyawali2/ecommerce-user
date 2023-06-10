import 'package:ecommerceuser/cubits/address_cubit/address_cubit.dart';
import 'package:ecommerceuser/widgets/shipping_address_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shipping Address',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[200],
                padding: const EdgeInsets.all(12),
                disabledBackgroundColor: Colors.grey,
                shape: const BeveledRectangleBorder()),
            onPressed: () {},
            child: const Text('Place Order'),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                BlocConsumer<AddressCubit, AddressState>(
                  listener: (context, state) {
                    if (state is AddressAdded) {
                      setState(() {
                        BlocProvider.of<AddressCubit>(context).getAddress();
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is AddressFetched) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.addressList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 190,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Country:   ${state.addressList[index].Country}\n',
                                        ),
                                        TextSpan(
                                          text:
                                              'State:   ${state.addressList[index].Province}\n',
                                        ),
                                        const TextSpan(
                                          text: 'City:   Kathmandu\n',
                                        ),
                                        const TextSpan(
                                          text: 'Postal Code:   44600\n',
                                        ),
                                        const TextSpan(
                                          text:
                                              'Street:   Pragati Nagar Tole\n',
                                        ),
                                        const TextSpan(
                                          text: 'Phone Number:    860846688\n',
                                        ),
                                        const TextSpan(
                                          text:
                                              'Other Landmarks or Description:   Beside Sunsity Apartment',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          });
                    } else if (state is AddressLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Text('Something Went Wrong');
                    }
                  },
                ),
                Visibility(
                  visible: true,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ShippingAddressDialog();
                        },
                      );
                    },
                    child: const Text(
                      'Add Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
