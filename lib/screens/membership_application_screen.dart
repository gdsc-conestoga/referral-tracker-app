import 'package:flutter/material.dart';
import 'package:referral_tracker/widgets/pageTitle.dart';

class MembershipApplicationScreen extends StatelessWidget {
  static const String id = '/membership_application';
  static const String _nameOnTitle = "Membership Application";
  static const double _columnWidth = 220;

  const MembershipApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Referral Tracker",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: const Text(
              "Log In",
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: _columnWidth,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: pageTitle(_nameOnTitle),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: _columnWidth,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Student number",
                    labelStyle: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: _columnWidth,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "🟡 Referrer student number (optional)",
                    labelStyle: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: _columnWidth,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Apply",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please note: Only current Conestoga students can apply for a membership.",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
