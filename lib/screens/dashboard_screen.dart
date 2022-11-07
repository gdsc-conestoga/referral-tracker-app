import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static String id = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Referral Tracker"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
      body: const Text(
        "this is app content",
      ),
    );
  }
}
