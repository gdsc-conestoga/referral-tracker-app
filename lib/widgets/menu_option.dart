import 'package:flutter/material.dart';

class MenuOption extends StatefulWidget {
  final String text;
  final bool isBold;

  const MenuOption({Key? key, required this.text, required this.isBold})
      : super(key: key);

  @override
  State<MenuOption> createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      child: Text(
        widget.text,
        style: TextStyle(color: Colors.white,
            fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
