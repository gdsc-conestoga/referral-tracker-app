import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/dashboard_screen.dart';
import 'package:referral_tracker/utils/database_service.dart';
import 'package:referral_tracker/widgets/pageTitle.dart';

class MembershipApplicationScreen extends StatefulWidget {
  static const String id = '/membership_application';
  static const String _nameOnTitle = "Membership Application";
  static const double _columnWidth = 220;

  const MembershipApplicationScreen({Key? key}) : super(key: key);

  @override
  State<MembershipApplicationScreen> createState() =>
      _MembershipApplicationScreenState();
}

class _MembershipApplicationScreenState
    extends State<MembershipApplicationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String studentNumber = "";
  String referrerStudentNumber = "";

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
                width: MembershipApplicationScreen._columnWidth,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: pageTitle(MembershipApplicationScreen._nameOnTitle),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MembershipApplicationScreen._columnWidth,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Student number",
                    labelStyle: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onChanged: (value) {
                    studentNumber = value;
                  },
                ),
              ),
              SizedBox(
                width: MembershipApplicationScreen._columnWidth,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "🟡 Referrer student number (optional)",
                    labelStyle: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onChanged: (value) {
                    referrerStudentNumber = value;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MembershipApplicationScreen._columnWidth,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () async {
                    String? email = _auth.currentUser?.email;
                    String? username = _auth.currentUser?.displayName;

                    if (email != null && username != null) {
                      await DatabaseService().addUser(
                          username: username,
                          email: email,
                          studentNumber: studentNumber);
                    }

                    // todo: update the referrer user and add a few coins to their 'total_coins'

                    Navigator.pushNamed(context, DashboardScreen.id);
                  },
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
