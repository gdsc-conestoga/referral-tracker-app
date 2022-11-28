import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Log Out",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
