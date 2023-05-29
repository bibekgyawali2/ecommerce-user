import 'package:flutter/material.dart';

Widget customButtton({onPressed, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange[200],
      minimumSize: const Size(
        double.infinity,
        55,
      ),
    ),
    onPressed: onPressed,
    child: Text(
      title!,
    ),
  );
}
