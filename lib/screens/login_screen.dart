import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/dashboard_screen.dart';
import 'package:referral_tracker/screens/membership_application_screen.dart';
import 'package:referral_tracker/screens/store_screen.dart';
import 'package:referral_tracker/widgets/store_item.dart';

class LogInScreen extends StatelessWidget {
  static String id = '/';

  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Referral Tracker",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              debugPrint("Login button pressed");
            },
            child: const Text("Log In"),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          width: 200,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, StoreScreen.id);
                },
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Go to Store Screen"),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Student number",
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () {},
                  child: const Text("Log in"),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {},
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Forgot password?"),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, MembershipApplicationScreen.id);
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Apply for membership"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
