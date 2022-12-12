import 'package:flutter/material.dart';
import 'package:referral_tracker/widgets/store_item.dart';

class StoreScreen extends StatelessWidget {
  static const String id = '/store';
  static const String nameOnAppBar = "Store";
  static const int _columnCount = 3;

  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Screen"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: _columnCount,
              children: [
                for (int i = 0; i < 10; i++) const StoreItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
