import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/store_screen.dart';
import 'package:referral_tracker/widgets/app_bar_buttons.dart';
import 'package:referral_tracker/widgets/app_name.dart';
import 'package:referral_tracker/widgets/leaderboard.dart';
import 'package:referral_tracker/widgets/log_out_button.dart';
import 'package:referral_tracker/widgets/page_title.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = '/dashboard';
  static const String nameOnAppBar = "Dashboard";
  static const String _nameOnTitle = "Top Member Scores";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            appName,
            const SizedBox(
              width: 50,
            ),
            const Text(
              nameOnAppBar,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            appBarPageButton(context, StoreScreen.nameOnAppBar, StoreScreen.id),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              "69,420,000 🪙",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const LogOutButton(),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            children: [
              pageTitle(_nameOnTitle),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 400,
                child: Leaderboard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
