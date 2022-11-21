import 'package:flutter/material.dart';
import 'package:referral_tracker/widgets/store_item.dart';

class StoreScreen extends StatelessWidget {
  static const String id = '/store';

  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Screen"),
      ),
      body: Column(
        children: const [
          StoreItem(),
          StoreItem(),
          StoreItem(),
          StoreItem(),
          StoreItem(),
        ],
      ),
    );
  }
}
