import 'package:flutter/material.dart';

class MenuOption extends StatefulWidget {
  final String text;
  final bool isBold;
  final void Function() callback;

  const MenuOption({
    Key? key,
    required this.text,
    required this.isBold,
    required this.callback,
  }) : super(key: key);

  @override
  State<MenuOption> createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.callback,
      child: Text(
        widget.text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
