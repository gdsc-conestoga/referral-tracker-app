import 'package:flutter/material.dart';

class StoreItem extends StatefulWidget {
  const StoreItem({Key? key}) : super(key: key);

  @override
  State<StoreItem> createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network('https://picsum.photos/250?image=9'),
          const Text("Item name"),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Purchase"),
          ),
        ],
      ),
    );
  }
}
