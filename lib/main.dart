import 'package:firebase_core/firebase_core.dart';
import 'package:referral_tracker/visuals.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ReferralTrackerApp());

class ReferralTrackerApp extends StatelessWidget {
  const ReferralTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Referral Tracker App",
      theme: ThemeData(
        appBarTheme: trackerAppBarTheme,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Referral Tracker",
            style: trackerAppBarTextStyle,
          ),
        ),
        body: const Text("this is app content"),
      ),
    );
  }
}
