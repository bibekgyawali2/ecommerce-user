import 'package:flutter/material.dart';

Widget customButtton({onPressed, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.orange[200],
      minimumSize: const Size(
        double.infinity,
        52,
      ),
    ),
    onPressed: onPressed,
    child: Text(
      title!,
    ),
  );
}
