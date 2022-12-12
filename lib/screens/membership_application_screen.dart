import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/dashboard_screen.dart';
import 'package:referral_tracker/utils/database_service.dart';
import 'package:referral_tracker/widgets/page_title.dart';
import 'package:uuid/uuid.dart';
import 'package:validation_chain/validation_chain.dart';
import 'package:referral_tracker/utils/sanitize_string.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String studentNumber = "";
  String referrerStudentID = "";
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
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Student number",
                      labelStyle: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    onChanged: (value) {
                      if (_formKey.currentState!.validate()) {
                        studentNumber = const SanitizationChain(
                              [trim],
                            ).sanitize(value) ??
                            "";
                      }
                    },
                    validator: const ValidationChain([
                      isRequired,
                      isNumeric,
                      correctLength,
                    ]).validate,
                  ),
                ),
              ),
              SizedBox(
                width: MembershipApplicationScreen._columnWidth,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "🟡 Referrer ID (optional)",
                    labelStyle: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onChanged: (value) {
                    referrerStudentID = const SanitizationChain(
                          [trim],
                        ).sanitize(value) ??
                        "";
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
                    if (studentNumber == "") {
                      debugPrint("No valid student number");
                      return;
                    }

                    debugPrint("student number: $studentNumber");
                    final String uuid =
                        const Uuid().v5(Uuid.NAMESPACE_URL, studentNumber);

                    debugPrint("uuid: $uuid");
                    final database = DatabaseService();

                    final DocumentSnapshot document =
                        await database.documentLookupByUuid(uuid);
                    debugPrint("document: $document");
                    final bool applicantExists = await database.hasUser(uuid);

                    if (applicantExists) {
                      debugPrint("Applicant has already been registered.");
                      return;
                    }

                    String? email = _auth.currentUser?.email;
                    String? username = _auth.currentUser?.displayName;
                    debugPrint("email: $email, name: $username");

                    if (email != null && username != null) {
                      final bool status = await database.addUser(uuid,
                          username: username,
                          email: email,
                          studentNumber: studentNumber);
                      debugPrint("User successfully added: $status");
                    } else {
                      debugPrint("Missing email and/or username.");
                      return;
                    }

                    if (referrerStudentID == "") {
                      debugPrint(
                          "No referrer/Applicant did not name referrer.");
                    } else {
                      debugPrint("referer ID: $referrerStudentID");

                      final bool referrerExists =
                          await database.hasUser(referrerStudentID);
                      if (!referrerExists) {
                        debugPrint("Cannot find referrer in database.");
                      } else {
                        final bool bonusIsApplied =
                            await database.addReferralBonus(
                                referrerStudentID, _referralBonus);
                        debugPrint("bonus applied: $bonusIsApplied");
                      }
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
