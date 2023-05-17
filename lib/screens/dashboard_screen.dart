import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/store_screen.dart';
import 'package:referral_tracker/widgets/custom_table.dart';
import 'package:referral_tracker/widgets/menu_option.dart';

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
          MenuOption(
            text: 'Dashboard',
            isBold: true,
            callback: () => Navigator.pushNamed(context, DashboardScreen.id),
          ),
          MenuOption(
            text: 'Store',
            isBold: false,
            callback: () => Navigator.pushNamed(context, StoreScreen.id),
          ),
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Log Out',
            onPressed: () {},
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
