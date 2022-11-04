import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:referral_tracker/constants.dart';
import 'package:referral_tracker/visuals.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        home: (context) => const WelcomeScreen(),
        applicationPageRoute: (context) => const ApplicationScreen(),
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
            appBar: AppBar(title: trackerTitle, actions: <Widget>[
              TextButton(
                onPressed: () {
                  debugPrint("Login button pressed");
                },
                child: const Text("Log In", style: trackerLoginButtonStyle),
              ),
            ]),
            body: Center(
                child: Container(
              margin: const EdgeInsets.only(top: 100),
              width: 200,
              child: Column(children: [
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
                const SizedBox(height: 10),
                ClipRect(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: CustomColours.conestogaBlack,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, home);
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(color: CustomColours.conestogaGold),
                      )),
                ),
                const SizedBox(height: 50),
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
              ]),
            ))));
  }
}

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Referral Tracker App",
      theme: ThemeData(
        appBarTheme: trackerAppBarTheme,
      ),
      home: Scaffold(
        appBar: AppBar(title: trackerTitle, actions: <Widget>[
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
