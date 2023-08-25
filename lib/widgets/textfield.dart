import 'package:flutter/material.dart';

Widget customTextfeild(title, controller, obsecure) {
  return TextFormField(
    obscureText: obsecure,
    controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: title,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}
