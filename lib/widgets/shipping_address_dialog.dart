import 'package:ecommerceuser/cubits/address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressDialog extends StatefulWidget {
  const ShippingAddressDialog({super.key});

  @override
  _ShippingAddressDialogState createState() => _ShippingAddressDialogState();
}

class _ShippingAddressDialogState extends State<ShippingAddressDialog> {
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController otherdiscription = TextEditingController();

  @override
  void dispose() {
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      insetPadding: const EdgeInsets.all(0),
      //contentPadding:
      //    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      title: const Text('Shipping Address'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: countryController,
                decoration: const InputDecoration(labelText: 'Country'),
              ),
              TextFormField(
                controller: stateController,
                decoration: const InputDecoration(labelText: 'State'),
              ),
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: postalCodeController,
                decoration: const InputDecoration(labelText: 'Postal Code'),
              ),
              TextFormField(
                controller: phonenumber,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              TextFormField(
                controller: street,
                decoration: const InputDecoration(labelText: 'Street Name'),
              ),
              TextFormField(
                controller: otherdiscription,
                decoration:
                    const InputDecoration(labelText: 'Other Description'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AddressCubit>(context).addAddress(
              city: cityController.text,
              country: countryController.text,
              phone: phonenumber.text,
              other: otherdiscription.text,
              postalcode: postalCodeController.text,
              province: stateController.text,
              street: street.text,
            );
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
