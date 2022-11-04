import 'package:firebase_core/firebase_core.dart';
import 'package:referral_tracker/visuals.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
      },
    ));

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("Log In", style: trackerLoginButtonStyle),
                  ),
                ]),
            body: Center(
                child: Container(
              margin: const EdgeInsets.only(top: 200),
              child: Column(children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("Apply for membership"))
              ]),
            ))));
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              "Referral Tracker Second Screen",
              style: trackerAppBarTextStyle,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel", style: trackerLoginButtonStyle),
              ),
            ]),
        body: const Text(
          "this is app content",
        ),
      ),
    );
  }
}
