import 'package:flutter/material.dart';

TextButton appBarPageButton(BuildContext context, String label, String route) {
  return TextButton(
    onPressed: () {
      Navigator.pushNamed(
        context,
        route,
      );
    },
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  );
}
