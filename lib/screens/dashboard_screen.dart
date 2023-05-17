import 'package:flutter/material.dart';
import 'package:referral_tracker/widgets/custom_table.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = '/dashboard';
  static const String nameOnAppBar = "Dashboard";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Referral Tracker'),
        ),
        actions: [
          TextButton(
            onPressed: ()=>{},
            child: const Text(
              'Dashboard',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Log Out',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: const Center(
          child: Column(
        children: [
          Center(child: Text('Top Member Scores')),
          CustomTable(),
        ],
      )),
    );
  }
}
