import 'package:ecommerceuser/widgets/shipping_address_dialog.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
                  text: const TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Country:   Nepal\n',
                      ),
                      TextSpan(
                        text: 'State:   Bagmati\n',
                      ),
                      TextSpan(
                        text: 'City:   Kathmandu\n',
                      ),
                      TextSpan(
                        text: 'Postal Code:   44600\n',
                      ),
                      TextSpan(
                        text: 'Street:   Pragati Nagar Tole\n',
                      ),
                      TextSpan(
                        text: 'Phone Number:    860846688\n',
                      ),
                      TextSpan(
                        text:
                            'Other Landmarks or Description:   Beside Sunsity Apartment',
                      ),
                    ],
                  ),
                ),
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
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
