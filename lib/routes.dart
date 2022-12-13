import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/dashboard_screen.dart';
import 'package:referral_tracker/screens/login_screen.dart';
import 'package:referral_tracker/screens/membership_application_screen.dart';
import 'package:referral_tracker/screens/store_screen.dart';
import 'package:referral_tracker/screens/rewards_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  LogInScreen.id: (context) => const LogInScreen(),
  DashboardScreen.id: (context) => const DashboardScreen(),
  StoreScreen.id: (context) => const StoreScreen(),
  RewardsScreen.id: (context) => const RewardsScreen(),
  MembershipApplicationScreen.id: (context) =>
      const MembershipApplicationScreen(),
};
