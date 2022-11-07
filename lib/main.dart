import 'package:referral_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/dashboard_screen.dart';
import 'package:referral_tracker/screens/login_screen.dart';

void main() => runApp(const ReferralTrackerApp());

class ReferralTrackerApp extends StatelessWidget {
  const ReferralTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        home: (context) => const LogInScreen(),
        applicationPageRoute: (context) => const DashboardScreen(),
      },
    );
  }
}
