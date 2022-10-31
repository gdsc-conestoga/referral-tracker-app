import 'package:flutter/material.dart';

void main() => runApp(const ReferralTrackerApp());

class ReferralTrackerApp extends StatelessWidget {
  const ReferralTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Referral Tracker App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Referral Tracker"),
        ),
        body: const Text("this is app content"),
      ),
    );
  }
}
