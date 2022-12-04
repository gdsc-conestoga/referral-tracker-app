import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:referral_tracker/main.dart';
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
  static const int _referralBonus = 5;

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
                    if (studentNumber == referrerStudentNumber) {
                      debugPrint(
                          "Applicant and referrer cannot be the same person.");
                      return;
                    }

                    final bool? applicantExists =
                        await DatabaseService().hasUser(studentNumber);

                    if (applicantExists == null) {
                      debugPrint("Error looking up applicant in database.");
                      return;
                    }

                    if (applicantExists) {
                      debugPrint("Applicant has already been registered.");
                      return;
                    }

                    String? email = _auth.currentUser?.email;
                    String? username = _auth.currentUser?.displayName;
                    debugPrint("email: $email, name: $username");

                    if (email != null && username != null) {
                      final bool status = await DatabaseService().addUser(
                          username: username,
                          email: email,
                          studentNumber: studentNumber);
                      debugPrint("User successfully added: $status");
                    } else {
                      debugPrint("Missing email and/or username.");
                      return;
                    }

                    final bool? referrerExists =
                        await DatabaseService().hasUser(referrerStudentNumber);

                    if (referrerExists == null) {
                      debugPrint("Error looking up referrer");
                    } else if (!referrerExists) {
                      debugPrint(
                          "Referrer does not exist/no longer exists in database.");
                    } else {
                      final bool bonusIsApplied = await DatabaseService()
                          .addReferralBonus(
                              referrerStudentNumber, _referralBonus);
                      debugPrint("bonus applied: $bonusIsApplied");
                    }

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
