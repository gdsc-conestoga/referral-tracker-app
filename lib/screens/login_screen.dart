import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/dashboard_screen.dart';
import 'package:referral_tracker/screens/membership_application_screen.dart';
import 'package:referral_tracker/screens/store_screen.dart';
import 'package:referral_tracker/widgets/store_item.dart';

class LogInScreen extends StatelessWidget {
  static const String id = '/';

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
            child: const Text(
              "Log In",
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 200),
          width: 200,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[300])),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Log in with ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Image(
                            width: 25,
                            image: AssetImage('assets/google-logo.png')),
                      ],
                    )),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[300]),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      MembershipApplicationScreen.id,
                    );
                  },
                  child: const Text(
                    "Apply for Membership",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
