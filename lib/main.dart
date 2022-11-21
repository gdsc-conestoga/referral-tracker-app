import 'package:flutter/material.dart';
import 'package:referral_tracker/routes.dart';
import 'package:referral_tracker/screens/login_screen.dart';

void main() => runApp(const ReferralTrackerApp());

class ReferralTrackerApp extends StatelessWidget {
  const ReferralTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LogInScreen.id,
      routes: routes,
    );
  }
}
