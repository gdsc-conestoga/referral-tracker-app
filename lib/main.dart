import 'package:referral_tracker/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ReferralTrackerApp());

class ReferralTrackerApp extends StatelessWidget {
  const ReferralTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        home: (context) => const LogInScreen(),
        applicationPageRoute: (context) => const ApplicationScreen(),
      },
    );
  }
}

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Referral Tracker"),
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
                  onPressed: () {
                    Navigator.pushNamed(context, home);
                  },
                  child: const Text("Log in"),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, home);
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Forgot password?"),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, applicationPageRoute);
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Apply for membership"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Referral Tracker"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
      body: const Text(
        "this is app content",
      ),
    );
  }
}
